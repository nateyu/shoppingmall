class Activity < ActiveRecord::Base
  include ImageField
  self.table_name = 'ACTIVITY'
  belongs_to :customer, foreign_key: 'customerId'
  belongs_to :mall, foreign_key: 'mallid'

  image_field :logoUrl, :posterUrl
end
