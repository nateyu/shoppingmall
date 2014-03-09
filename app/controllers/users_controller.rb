class UsersController < ApplicationController
  before_filter :admin_required
  include BaseController
  model_to_save User
end