class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def edit
    @good = Good.find params[:id]
  end

  def update
    params.permit!
    @good = Good.find params[:id]
    if @good.update_attributes params[:good]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @good = Good.new params["good"]
    if @good.save then redirect_to action: 'index'
    else  render 'new'
    end
  end

  def destroy
    @good = Good.find params[:id]
    @good.destroy
    redirect_to action: 'index'
  end

  def search
    query = params['good'].delete_if { |k, v| v.blank? }
    @goods = Good.where query
    render :index
  end
end
