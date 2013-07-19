class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.belongs_to :deck
      t.timestamps
    end
  end
end
