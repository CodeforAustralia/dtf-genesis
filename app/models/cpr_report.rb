class CprReport < ApplicationRecord
  has_one :cpr_score, :dependent => :destroy
end
