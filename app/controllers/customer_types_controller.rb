class CustomerTypesController < ApplicationController
  include BaseController
  model_to_save CustomerType, filter_by_mall: true
end