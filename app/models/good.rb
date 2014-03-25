class Good < ActiveRecord::Base
  include ImageField
  self.table_name = 'GOODS'
  belongs_to :mall, foreign_key: 'mallid'
  belongs_to :goods_type, foreign_key: 'goodstypeId'
  belongs_to :customer, foreign_key: 'customerId'
  
  image_field :logo1url
end
