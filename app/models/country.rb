class Country < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :beers, dependent: :destroy
end
