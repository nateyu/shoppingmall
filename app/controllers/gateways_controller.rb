class GatewaysController < ApplicationController
  before_filter :admin_required
  include BaseController
  model_to_save Gateway
end
