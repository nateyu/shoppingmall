class CreateGoods < ActiveRecord::Migration
  def change
    create_table :GOODS do |t|
      t.string :name
      t.integer :customerId
      t.decimal :price, precision: 15, scale: 2
      t.decimal :discountprice, precision: 15, scale: 2
      t.text  :homepageLoc
      t.integer :goodstypeId
      t.integer :mallid
      t.date    :createDate
      t.text    :description
      t.text    :goodspic1url
      t.text    :goodspic2url
      t.text    :goodspic3url
      t.text    :goodspic4url
      t.text    :goodspic5url
    end
  end
end
