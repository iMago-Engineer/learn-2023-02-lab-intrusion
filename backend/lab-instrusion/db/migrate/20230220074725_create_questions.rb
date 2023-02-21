class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :answer, null: false
      t.integer :difficulty, null: false
      t.string :nickname, null: false

      t.timestamps
    end
  end
end
