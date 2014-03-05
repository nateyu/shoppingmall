class Activity < ActiveRecord::Base
  self.table_name = 'ACTIVITY'
  belongs_to :customer, foreign_key: 'customerId'
end
