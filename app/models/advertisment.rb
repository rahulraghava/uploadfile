class Advertisment < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  belongs_to :variant
end
