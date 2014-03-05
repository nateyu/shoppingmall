class CreateGoodsTypes < ActiveRecord::Migration
  def change
    create_table :GOODS_TYPES do |t|
      t.string :name
      t.boolean :status
      t.integer :weight
      t.integer :category
    end
  end
end
