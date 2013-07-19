class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :user_answer, null: false
      t.boolean :correct, default: false, null: false
      t.belongs_to :flashcard, null: false
      t.belongs_to :round, null: false
      t.timestamps
    end
  end
end
