class Supplier < ApplicationRecord
  has_many :csr_performance_reports, dependent: :destroy
end
