class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :rounds
end
