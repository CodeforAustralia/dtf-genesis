class Department < ApplicationRecord
  has_many :project
  has_many :contract
end
