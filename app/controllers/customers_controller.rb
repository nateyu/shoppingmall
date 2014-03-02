class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find params[:id]
  end

  def update
    params.permit!
    @customer = Customer.find params[:id]
    if @customer.update_attributes params[:customer]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @customer = Customer.new params["customer"]
    if @customer.save then redirect_to action: 'index'
    else  render 'new'
    end
  end

  def search
    query = params['customer'].delete_if { |k, v| v.blank? }
    @customers = Customer.where query
    render :index
  end
end
