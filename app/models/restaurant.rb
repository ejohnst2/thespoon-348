class Restaurant < ApplicationRecord
  include NameValidations
  has_many :reviews, dependent: :destroy

  validate :check_spelling_grammar_things

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }


end
