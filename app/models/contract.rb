class Contract < ApplicationRecord
  validates :vt_contract_number, presence: true
  validates :vt_title, presence: true
  validates :vt_start_date, presence: true
  validates :vt_total_value, presence: true
end
