class CreateTrials < ActiveRecord::Migration[7.0]
  def change
    create_table :trials do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :count, null: false
      t.string :nickname, null:true
      t.boolean :solved, null:false

      t.timestamps
    end
  end
end
