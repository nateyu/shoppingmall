class CreateMalls < ActiveRecord::Migration
  def change
    create_table :MALLS do |t|
      t.string :name
      t.string :version
      t.timestamps
    end
  end
end
