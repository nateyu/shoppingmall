class CreateUsers < ActiveRecord::Migration
  def change
    create_table :USERS do |t|
      t.string  :name
      t.string  :password
      t.string  :role
      t.integer :mallid
      t.timestamps
    end
  end
end
