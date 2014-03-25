class ActivitiesController < ApplicationController
  include BaseController
  model_to_save Activity, filter_by_mall: true

  def search
    query = params['activity'].delete_if { |k, v| v.blank? }
    @activities = Activity.where query
    render :index
  end
end