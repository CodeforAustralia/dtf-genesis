class CsrContract < ApplicationRecord
  belongs_to :supplier
  has_one :csr_performance_report
end
