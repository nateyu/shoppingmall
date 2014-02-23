class CreateCustomerTypes < ActiveRecord::Migration
  def change
    create_table :customer_types do |t|

      t.timestamps
    end
  end
end
