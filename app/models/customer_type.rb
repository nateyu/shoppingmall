class CustomerType < ActiveRecord::Base
  self.table_name = 'CUSTOMERTYPE'
  # accepts_nested_attributes_for :name, :status, :description
end
