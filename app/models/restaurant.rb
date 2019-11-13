class Restaurant < ApplicationRecord

  CATEGORIES = ['Italian', 'Indian', 'Greek', 'Japanese', 'Belgian', 'French', 'German', 'Russian', 'Polish', 'Turkish', 'Thai', 'Vietnamese', 'Chinese']
  before_validation :capitalize_category

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: {
    in: CATEGORIES
  }

  private

  def capitalize_category
    self.category = category.capitalize unless category.nil?
  end
end
