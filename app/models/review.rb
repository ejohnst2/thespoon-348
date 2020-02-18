class Review < ApplicationRecord
  belongs_to :restaurant

  validate :check_spelling_grammar_things
end
