class HomePageLocationsController < ApplicationController
  include BaseController
  model_to_save Homepageloc, filter_by_mall: true

  def search_locations
     locs = Homepageloc.available_locations(current_mall.id, params[:loctype])
     items =  Homepageloc.available_items current_mall.id, params[:loctype]
     render :json => {locs: locs, items: items}
  end
end