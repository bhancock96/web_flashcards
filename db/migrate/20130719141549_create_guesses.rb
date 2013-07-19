class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :user_answer
      t.boolean :correct, default: false
      t.belongs_to :flashcard
      t.belongs_to :round
      t.timestamps
    end
  end
end
