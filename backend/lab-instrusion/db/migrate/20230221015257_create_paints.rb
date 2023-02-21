class CreatePaints < ActiveRecord::Migration[7.0]
  def change
    create_table :paints do |t|
      t.references :question, null: false, foreign_key: true
      t.string :target, null: false
      t.integer :painted_count, null:false

      t.timestamps
    end
  end
end
