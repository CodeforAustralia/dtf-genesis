class InitialDataOnLocationCodes < ActiveRecord::Migration[6.0]
  def change
    LocationCode.create code: 'BUS',
                        description: 'Business Address'
  end
end
