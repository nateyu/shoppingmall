class CustomerType < ActiveRecord::Base
  self.table_name = 'CUSTOMERTYPE'
  
  has_many :customers, foreign_key: 'typeid'
end
