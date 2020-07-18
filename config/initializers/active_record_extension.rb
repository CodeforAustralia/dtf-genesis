module ActiveRecordExtension

  extend ActiveSupport::Concern

  module ClassMethods

    class StatementBuilder
  
      def initialize(column, type, value, operator)
        @column = column
        @type = type
        @value = value
        @operator = operator
      end

      def to_statement
        
        return if [@operator, @value].any? { |v| v == '_discard' }

        unary_operators[@operator] || unary_operators[@value] ||
          build_statement_for_type_generic
      end
  
  
      protected

      def unary_operators
        {
          '_blank' => ["(#{@column} IS NULL OR #{@column} = '')"],
          '_present' => ["(#{@column} IS NOT NULL AND #{@column} != '')"],
          '_null' => ["(#{@column} IS NULL)"],
          '_not_null' => ["(#{@column} IS NOT NULL)"],
          '_empty' => ["(#{@column} = '')"],
          '_not_empty' => ["(#{@column} != '')"],
        }
      end

      private

      def range_filter(min, max)
        if min && max
          ["(#{@column} BETWEEN ? AND ?)", min, max]
        elsif min
          ["(#{@column} >= ?)", min]
        elsif max
          ["(#{@column} <= ?)", max]
        end
      end

      def build_statement_for_type
        case @type
        when :boolean                   then build_statement_for_boolean
        when :integer, :decimal, :float then build_statement_for_integer_decimal_or_float
        when :string, :text             then build_statement_for_string_or_text
        when :enum                      then build_statement_for_enum
        when :belongs_to_association    then build_statement_for_belongs_to_association
        end
      end

      def build_statement_for_boolean
        return ["(#{@column} IS NULL OR #{@column} = ?)", false] if %w(false f 0).include?(@value)
        return ["(#{@column} = ?)", true] if %w(true t 1).include?(@value)
      end

      def column_for_value(value)
        ["(#{@column} = ?)", value]
      end

      def build_statement_for_belongs_to_association
        return if @value.blank?
        ["(#{@column} = ?)", @value.to_i] if @value.to_i.to_s == @value
      end

      def build_statement_for_string_or_text
        return if @value.blank?
        @value = begin
          case @operator
          when 'default', 'like'
            "%#{@value.downcase}%"
          when 'starts_with'
            "#{@value.downcase}%"
          when 'ends_with'
            "%#{@value.downcase}"
          when 'is', '='
            "#{@value.downcase}"
          else
            return
          end
        end
        ["(LOWER(#{@column}) #{like_operator} ?)", @value]
      end

      def build_statement_for_enum
        return if @value.blank?
        ["(#{@column} IN (?))", Array.wrap(@value)]
      end

      def ar_adapter
        ::ActiveRecord::Base.connection.adapter_name.downcase
      end

      def like_operator
        ar_adapter == 'postgresql' ? 'ILIKE' : 'LIKE'
      end
  
  
      #  from parrent
      def get_filtering_duration
        FilteringDuration.new(@operator, @value).get_duration
      end

      def build_statement_for_type_generic
        
        build_statement_for_type || begin
          case @type
          when :date
            build_statement_for_date
          when :datetime, :timestamp
            build_statement_for_datetime_or_timestamp
          end
        end
      end

      def build_statement_for_integer_decimal_or_float
        case @value
        when Array, Hash then
          p @value
          normal_value = []
          @value.each_pair { |key, value| normal_value.push(value) }
          @value = normal_value
          p @value
          val, range_begin, range_end = *@value.collect do |v|
            next unless v.to_i.to_s == v || v.to_f.to_s == v
            @type == :integer ? v.to_i : v.to_f
          end
          case @operator
          when 'between'
            range_filter(range_begin, range_end)
          else
            column_for_value(val) if val
          end
        else
          if @value.to_i.to_s == @value || @value.to_f.to_s == @value
            @type == :integer ? column_for_value(@value.to_i) : column_for_value(@value.to_f)
          end
        end
      end

      def build_statement_for_date
        range_filter(*get_filtering_duration)
      end

      def build_statement_for_datetime_or_timestamp
        start_date, end_date = get_filtering_duration
        start_date = start_date.to_time.beginning_of_day if start_date
        end_date = end_date.to_time.end_of_day if end_date
        range_filter(start_date, end_date)
      end

  
      class FilteringDuration
        def initialize(operator, value)
          @value = value
          @operator = operator
        end

        def get_duration
          case @operator
          when 'between'   then between
          when 'today'     then today
          when 'yesterday' then yesterday
          when 'this_week' then this_week
          when 'last_week' then last_week
          else default
          end
        end

        def today
          [Date.today, Date.today]
        end

        def yesterday
          [Date.yesterday, Date.yesterday]
        end

        def this_week
          [Date.today.beginning_of_week, Date.today.end_of_week]
        end

        def last_week
          [1.week.ago.to_date.beginning_of_week,
            1.week.ago.to_date.end_of_week]
        end

        def between
          [convert_to_date(@value[1]), convert_to_date(@value[2])]
        end

        def default
          [default_date, default_date]
        end

        private

        def date_format
          I18n.t('admin.misc.filter_date_format',
            default: I18n.t('admin.misc.filter_date_format', locale: :en)).gsub('dd', '%d').gsub('mm', '%m').gsub('yy', '%Y')
        end

        def convert_to_date(value)
          value.present? && Date.strptime(value, date_format)
        end

        def default_date
          default_date_value = Array.wrap(@value).first
          convert_to_date(default_date_value) rescue false
        end
      end
  
    end


    class WhereBuilder
      def initialize(scope)
        @statements = []
        @values = []
        @tables = []
        @scope = scope
      end

      def add(field, value, operator)
        if !field.nil?
          field[:searchable_columns].each do |column_infos|
            statement, value1, value2 = StatementBuilder.new(column_infos[:column], column_infos[:type], value, operator).to_statement
            @statements << statement if statement.present?
            @values << value1 unless value1.nil?
            @values << value2 unless value2.nil?
            table, column = column_infos[:column].split('.')
            @tables.push(table) if column
          end
        end
      end

      def build
        scope = @scope.where(@statements.join(' OR '), *@values)
        scope = scope.references(*(@tables.uniq)) if @tables.any?
        scope
      end
    end

    def query_scope(scope, query, fields = config.list.fields.select(&:queryable?))
      wb = WhereBuilder.new(scope)
      fields.each do |field|
        wb.add(field, query, 'default')
      end
      # OR all query statements
      wb.build
    end

    # filters example => {"string_field"=>{"0055"=>{"o"=>"like", "v"=>"test_value"}}, ...}
    # "0055" is the filter index, no use here. o is the operator, v the value
    def filter_scope(scope, filters, fields = config.list.fields.select(&:filterable?))
      filters.each_pair do |field_name, filters_dump|
        filters_dump.each do |_, filter_dump|
          if filter_dump[:o] != 'skip'
            wb = WhereBuilder.new(scope)
            wb.add(fields.detect { |f| f[:name].to_s == field_name }, filter_dump[:v], (filter_dump[:o] || 'default'))
            # AND current filter statements to other filter statements
            scope = wb.build
          end
        end
      end
      scope
    end

    def build_statement(column, type, value, operator)
      StatementBuilder.new(column, type, value, operator).to_statement
    end

    def all_with_filter(options = {}, scope = nil)

      fields = model_fields
      scope = query_scope(scope, options[:query], fields) if options[:query]
      scope = filter_scope(scope, options[:filters], fields) if options[:filters]

      scope
    end
    
    def model_fields
      columns = []
      self.columns.each { |column|  
        columns.push({
            :name => column.name,
#            :search_operator => "is",
            :searchable_columns => [
              {
                :column => column.name,
                :type => column.type,
              }
            ]
          })
      }
      columns
    end
    
    
    
  end
end

# include the extension 
ActiveRecord::Base.send(:include, ActiveRecordExtension)