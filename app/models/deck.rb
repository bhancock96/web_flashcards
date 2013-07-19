class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :rounds

  def get_next_flashcard
    @flashcards_not_guessed = self.where(correct: 'false')
  end
end
