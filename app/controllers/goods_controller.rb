class GoodsController < ApplicationController
  include BaseController
  model_to_save Good, filter_by_mall: true

  def search
    query = params['good'].delete_if { |k, v| v.blank? }
    @goods = Good.where query
    render :index
  end
end
