class Gateway < ActiveRecord::Base
  self.table_name = 'GATEWAYS'
  belongs_to :mall, foreign_key: 'mallid'
end
