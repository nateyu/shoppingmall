class Mall < ActiveRecord::Base
  self.table_name = 'MALLS'
  has_many  :users, foreign_key: 'mallid'
  has_many  :gateways, foreign_key: 'mallid'
  has_many  :activities, foreign_key: 'mallid'
  has_many  :customers, foreign_key: 'mallid'
  has_many  :customer_types, foreign_key: 'mallid'
  has_many  :good_types, foreign_key: 'mallid'
  has_many  :goods, foreign_key: 'mallid'
  has_many  :homepagelocs, foreign_key: 'mallid'
end
