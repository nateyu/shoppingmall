class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :CUSTOMER do |t|
      t.string :name
      t.integer :typeid
      t.text :address
      t.string :phone
      t.text :description
      t.text :logo1url
      t.text :map
      t.text :posterUrl
      t.boolean :obsolete
      t.integer :mallid
      t.timestamps
    end
  end
end
