class Ingredient < ApplicationRecord
  belongs_to :sushi, optional: true
  validates_presence_of :name
end
