class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.text :password
      t.integer :status

      t.timestamps
    end
  end
end
