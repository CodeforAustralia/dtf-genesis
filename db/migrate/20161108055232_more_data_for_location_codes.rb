class MoreDataForLocationCodes < ActiveRecord::Migration[5.0]
  def change
        LocationCode.create code: 'XTR',
                            description: 'Extra Address'
        LocationCode.create code: 'BRN',
                            description: 'Branch Office Address'
        LocationCode.create code: 'REG',
                            description: 'Registered Address'                                                                                    
        LocationCode.create code: 'OTH',
                            description: 'Other Address'  
  end
end

