class Contract < ApplicationRecord
  validates :vt_contract_number, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :total_value, presence: true
end
