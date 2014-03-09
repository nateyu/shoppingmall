class CustomerType < ActiveRecord::Base
  self.table_name = 'CUSTOMERTYPE'
  belongs_to :mall, foreign_key: 'mallid'
  has_many :customers, foreign_key: 'typeid'
end
