class Restaurant < ApplicationRecord

  CATEGORIES = ['Italian', 'Indian', 'Greek', 'Japanese', 'Belgian', 'French', 'German', 'Russian', 'Polish', 'Turkish', 'Thai', 'Vietnamese', 'Chinese']
  before_validation :capitalize_category, :clean_phone_number

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: {
    in: CATEGORIES
  }

  def average_review
    average_review = self.reviews.average(:rating)
    average_review = 0 if average_review.nil?
    average_review
  end

  def count_reviews
    count_reviews = self.reviews.count(:rating)
    count_reviews = 0 if self.reviews.nil?
    count_reviews
  end

  private

  def capitalize_category
    self.category = category.capitalize unless category.nil?
  end



end
