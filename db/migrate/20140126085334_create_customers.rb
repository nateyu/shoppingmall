class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :CUSTOMER do |t|
      t.string :name
      t.integer :typeid
      t.text :address
      t.string :phone
      t.text :description
      t.datetime :createDate
      t.datetime :lastupdate
      t.text :logo1url
      t.text :logo2url
      t.boolean :obsolete
      t.string :homepageLoc
      t.integer :mallid
    end
  end
end
