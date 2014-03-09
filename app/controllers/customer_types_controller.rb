class CustomerTypesController < ApplicationController
  include BaseController
  model_to_save CustomerType
end