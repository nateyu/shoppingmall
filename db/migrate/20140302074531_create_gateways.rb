class CreateGateways < ActiveRecord::Migration
  def change
    create_table :GATEWAYS do |t|
      t.integer :mallid
      t.string :deviceid
      t.timestamps
    end
  end
end
