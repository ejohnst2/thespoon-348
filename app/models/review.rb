class Review < ApplicationRecord
  include NameValidations

  belongs_to :restaurant

  validate :check_spelling_grammar_things

end
