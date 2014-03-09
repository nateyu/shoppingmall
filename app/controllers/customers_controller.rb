class CustomersController < ApplicationController
  include BaseController
  model_to_save Customer
  
  def search
    query = params['customer'].delete_if { |k, v| v.blank? }
    @customers = Customer.where query
    render :index
  end
end
