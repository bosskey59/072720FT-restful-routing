class Sushi < ApplicationRecord
  has_many :ingredients
  validates_presence_of :name
  validates :name, uniqueness: true
  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes["name"] == "" || attributes["calories"] == "" || attributes["ss_grams"] == "" }
  scope :search, -> (query) { where("LOWER(name) LIKE ?", "%#{query.downcase}%") }

  # def self.search(query)
  #   self.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
  # end

  # validates :name, length: { in: 3..30 }
  # validates :name, confirmation: true
  # validates :name_confirmation, presence: true
  # validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validate :starts_with_a
  # validate :random

  # def ingredients_attributes=(ing_atts)
  #   ing_atts.values.each do |ing|
  #     if  ing["name"] != "" && ing["calories"] != "" && ing["ss_grams"] != "" 
  #       self.ingredients.build(ing)
  #     end
  #   end
  # end

  

  def formated_time
    self.created_at.strftime("%a, %e %b %Y %H:%M")
  end
  


  private
    def starts_with_a
        if name[0].downcase == "a"
          errors.add(:name , "cannot have 'a' as the first letter")
        end
    end

    def random
      if self.name.length == 4
        if self.name[0] != "t"
          errors.add(:name , "is 4 chars and must start with letter t")
        end
      end

    end

end
