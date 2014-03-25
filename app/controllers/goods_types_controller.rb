class GoodsTypesController < ApplicationController
  include BaseController
  model_to_save GoodsType, filter_by_mall: true
  
  def search
    query = params['goods_type'].delete_if { |k, v| v.blank? }
    @goods_types = GoodsType.where query
    render :index
  end
end
