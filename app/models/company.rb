class Company < ApplicationRecord
  belongs_to :country
  has_many :beers, dependent: :destroy
end
