class Location < ApplicationRecord
  belongs_to :contract
  belongs_to :equipment
end
