module ValueTypesHelper

  def lookup_value_type text
    value_type = 0
    ContractValueType.all.each do |value_type|
      if text.include? value_type.type_description
        value_type = value_type.id
        break
      end
    end
    value_type
  end

end
