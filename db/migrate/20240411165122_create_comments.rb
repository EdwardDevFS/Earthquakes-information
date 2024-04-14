class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :description, null:false
      t.references :earthquake, null: false, foreign_key: true

      t.timestamps
    end
  end
end
