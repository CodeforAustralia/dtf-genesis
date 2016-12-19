module DepartmentHelper

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
