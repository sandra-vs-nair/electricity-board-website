class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :password_digest
      t.string :email_id
      t.string :address

      t.timestamps
    end
  end
end
