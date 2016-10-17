class Contract < ApplicationRecord
  validates :contract_number, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :total_value, presence: true
end
