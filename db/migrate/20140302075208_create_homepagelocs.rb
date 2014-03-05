class CreateHomepagelocs < ActiveRecord::Migration
  def change
    create_table :HOMEPAGELOCS do |t|
      t.string  :loctype
      t.integer :location
      t.integer :itemid
      t.integer :mallid
      t.timestamps
    end
  end
end
