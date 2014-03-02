class CustomerTypesController < ApplicationController
  def index
    @customer_types = CustomerType.all
  end

  def new
    @customer_type = CustomerType.new
  end

  def edit
    @customer_type = CustomerType.find params[:id]
  end

  def update
    params.permit!
    @customer_type = CustomerType.find params[:id]
    if @customer_type.update_attributes params[:customer_type]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @customer_type = CustomerType.new params["customer_type"]
    if @customer_type.save then redirect_to action: 'index'
    else  render 'new'
    end
  end
end
