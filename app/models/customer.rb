class Customer < ActiveRecord::Base
  include ImageField
  self.table_name = 'CUSTOMER'
  belongs_to :mall, foreign_key: 'mallid'
  belongs_to :customer_type, foreign_key: 'typeid'
  has_many  :goods, foreign_key: 'customerId'
  has_many  :activities, foreign_key: 'customerId'
  
  image_field :logo1url, :map, :posterUrl
end
