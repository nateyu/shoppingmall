class CreateActivities < ActiveRecord::Migration
  def change
    create_table :ACTIVITY do |t|
      t.string  :name
      t.integer :customerId
      t.date    :startDate
      t.date    :endDate
      t.text    :description
      t.text    :logoUrl
      t.text    :posterUrl
      t.integer :mallid
      t.timestamps
    end
  end
end
