class CreateCustomerTypes < ActiveRecord::Migration
  def change
    create_table :CUSTOMERTYPE do |t|
      t.string  :name
      t.text    :description
      t.boolean :status
      t.integer :mallid
      t.timestamps
    end
  end
end
