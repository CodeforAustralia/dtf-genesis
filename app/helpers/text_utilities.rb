module TextUtilities

  def find_between text, pre_string, post_string
    matches = text.match(/#{pre_string}(.*?)#{post_string}/)
    if matches && matches.length > 1
      matches[1].strip
    else
      # puts "Match failed!"
      # puts "nothing between '#{pre_string}' & '#{post_string}'"
      # puts "in #{text}"
      ""
    end
  end

  def create_address s_address, s_suburb, s_state, s_pc
    return "#{s_address}, #{s_suburb}, #{s_state} #{s_pc}"
  end

end
