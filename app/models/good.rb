class Good < ActiveRecord::Base
  self.table_name = 'GOODS'
  belongs_to :goods_type, foreign_key: 'goodstypeId'
  belongs_to :customer, foreign_key: 'customerId'
end
