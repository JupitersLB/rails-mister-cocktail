class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  def aos_picker(idx)
    if (idx % 3).zero?
      'fade-right'
    elsif idx % 3 == 1
      'fade-up'
    else
      'fade-left'
    end
  end
end
