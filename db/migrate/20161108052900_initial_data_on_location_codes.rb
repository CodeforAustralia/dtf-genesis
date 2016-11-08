class InitialDataOnLocationCodes < ActiveRecord::Migration[5.0]
  def change
    LocationCode.create code: 'BUS',
                        description: 'Business Address'
  end
end
