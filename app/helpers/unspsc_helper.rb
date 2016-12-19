module UnspscHelper

  def lookup_contract_unspsc text
    Unspsc.all.each do |unspsc_category|
      if text.include?(unspsc_category.unspsc_name)
        return unspsc_category.unspsc_code
      end
    end
    0
  end

end
