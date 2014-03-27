class GatewaysController < ApplicationController
  before_filter :admin_required, except: [:pack_resources, :fetch_packages]
  before_filter :login_required, only: [:pack_resources]
  include BaseController
  model_to_save Gateway

  def pack_resources
    result = current_mall.pack_resources
    render json: result
  end

  def fetch_packages
    gateway = Gateway.find_by_deviceid params[:mallid]
    file = gateway ? gateway.mall.get_latest_resources : []
  
    unless file.empty?
      case request.query_parameters[:action]
      when '20'
        render :text => File.basename(file[0])
      when '21'
        send_file file.first
      end
    else
      render text: '',  status: :not_found
    end
  end
end
