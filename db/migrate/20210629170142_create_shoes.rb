class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :date
      t.integer :amount
      t.boolean :purchased, :default => false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
