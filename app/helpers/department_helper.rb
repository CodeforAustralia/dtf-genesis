module DepartmentHelper

  def check_department_reference department_string, department_index
    match = Department.where(vt_number: department_index).first
    if !match
      Department.all.each do |department| # fallback to string matching
        if department_string.downcase.gsub(" ","").include? department.name.downcase.gsub(" ","")
          if department.vt_number == 0 # dynamicaly add ref #
            department.vt_number = department_index
            department.save
            puts ":: UPDATED DEPARTMENT REF: #{department.name} <== #{department_index}::"
          end
        end
      end
      puts "Dynamicaly creating '#{department_string}' with ref #{department_index}"
      Department.create(name: department_string, short_name: "Ref-#{department_index}", vt_number: department_index)
    end
  end

  def clean_department_link_text text
    text[0..(text.index("(")-2)]
  end

  def lookup_department_id department_text, print=false
      Department.all.each do |department|
        if department_text.downcase.gsub(" ","").include? department.name.downcase.gsub(" ","")
          return department.vt_number
        end
      end
      if print then puts "could not find agency '#{department_text}'" end
      0
  end

  def lookup_department_short_name department_id
    department = Department.where(vt_number: department_id).first
    if department
      department.short_name
    else
      ""
    end
  end

  def lookup_department_name department_id
    department = Department.where(vt_number: department_id).first
    if department
      department.name
    else
      ""
    end
  end

end
