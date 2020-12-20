class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :month
      t.float :amount
      t.string :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
