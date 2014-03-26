class GatewaysController < ApplicationController
  before_filter :admin_required, except: [:pack_resources, :pack_resources]
  before_filter :login_required, only: [:pack_resources, :pack_resources]
  include BaseController
  model_to_save Gateway

  def pack_resources
    result = current_mall.pack_resources
    render json: result
  end

  def fetch_packages
    
  end
end
