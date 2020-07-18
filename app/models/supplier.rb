class Supplier < ApplicationRecord
  has_many :csr_performance_reports, dependent: :destroy
  has_many :cpr_performance_reports, dependent: :destroy
  has_many :csr_contracts, dependent: :destroy
end
