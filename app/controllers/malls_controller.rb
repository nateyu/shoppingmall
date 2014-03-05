class MallsController < ApplicationController
  def index
    @malls = Mall.all
  end

  def new
    @mall = Mall.new
  end

  def edit
    @mall = Mall.find params[:id]
  end

  def update
    params.permit!
    @mall = Mall.find params[:id]
    if @mall.update_attributes params[:mall]  then redirect_to action: 'index'
    else    render 'edit'
    end
  end

  def create
    params.permit!
    @mall = Mall.new params["mall"]
    if @mall.save then redirect_to action: 'index'
    else  render 'new'
    end
  end
end
