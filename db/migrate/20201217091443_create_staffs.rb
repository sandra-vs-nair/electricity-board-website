class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.string :password_digest
      t.string :email_id
      t.string :address

      t.timestamps
    end
  end
end
