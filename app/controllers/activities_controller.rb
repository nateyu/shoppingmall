class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    params.permit!
    @activity = Activity.find params[:id]
    if @activity.update_attributes params[:activity]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @activity = Activity.new params["activity"]
    if @activity.save then redirect_to action: 'index'
    else  render 'new'
    end
  end

  def search
    query = params['activity'].delete_if { |k, v| v.blank? }
    @activities = Activity.where query
    render :index
  end
end
