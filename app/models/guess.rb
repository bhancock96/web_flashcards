class Guess < ActiveRecord::Base
  belongs_to :flashcard
  belongs_to :round
  belongs_to :user
end
