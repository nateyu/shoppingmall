class GoodsTypesController < ApplicationController
  def index
    @goods_types = GoodsType.all
  end

  def new
    @goods_type = GoodsType.new
  end

  def edit
    @goods_type = GoodsType.find params[:id]
  end

  def update
    params.permit!
    @goods_type = GoodsType.find params[:id]
    if @goods_type.update_attributes params[:goods_type]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @goods_type = GoodsType.new params["goods_type"]
    if @goods_type.save then redirect_to action: 'index'
    else  render 'new'
    end
  end

  def search
    query = params['goods_type'].delete_if { |k, v| v.blank? }
    @goods_types = GoodsType.where query
    render :index
  end
end
