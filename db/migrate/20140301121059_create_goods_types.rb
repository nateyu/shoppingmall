class CreateGoodsTypes < ActiveRecord::Migration
  def change
    create_table :goods_types do |t|
      t.string :name
      t.boolean :status
      t.integer :weight
      t.integer :category
    end
  end
end
