class CcrPerformanceReport < ApplicationRecord
  belongs_to :contract
  belongs_to :supplier
  belongs_to :department, optional: true
end
