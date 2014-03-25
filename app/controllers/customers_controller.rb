class CustomersController < ApplicationController
  include BaseController
  model_to_save Customer, filter_by_mall: true
  
  def search
    query = params['customer'].delete_if { |k, v| v.blank? }
    @customers = Customer.where query
    render :index
  end
end
