class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
