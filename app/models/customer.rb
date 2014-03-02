class Customer < ActiveRecord::Base
  self.table_name = 'CUSTOMER'

  belongs_to :customer_type, foreign_key: 'typeid'
  has_many  :goods, foreign_key: 'customerId'
end
