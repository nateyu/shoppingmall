class GoodsType < ActiveRecord::Base
  has_many :goods, foreign_key: 'goodstypeId'

  CATEGORIES = [['商品分类', 0], ['商品关键字', 1], ['商品品牌', 2]]
end