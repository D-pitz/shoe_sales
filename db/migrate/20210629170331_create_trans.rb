class CreateTrans < ActiveRecord::Migration
  def change
    create_table :trans do |t|
      t.string :name
      t.string :buyer
      t.string :seller
      t.string :date
      t.integer :amount
      t.boolean :purchased, :default => false
      t.references :user, index: true, foreign_key: true
      t.references :shoe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
