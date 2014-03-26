module BaseController
  extend ActiveSupport::Concern

  included do
    before_filter :load_model_object
  end
  
  module ClassMethods

    def model_to_save value, filter=nil
      define_method(:model_to_save) { value }
      define_method(:filter_by_mall) { filter.try('[]', :filter_by_mall) }
    end

  end

  def index
  end

  def new
  end

  def edit
  end

  def update
    if mode_object_variable[1].update_attributes params[model_to_save.name.underscore.to_sym]
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def create
    if mode_object_variable[1].save
       redirect_to action: 'index'
    else
       render 'new'
    end
  end

  def destroy
    mode_object_variable[1].delete
    redirect_to action: 'index'
  end

  private
  def load_model_object
    self.instance_variable_set *mode_object_variable
  end

  def mode_object_variable
    params.permit!
    class_str = (action_name.eql? 'index') ?  model_to_save.name.tableize
                                           :  model_to_save.name.underscore
    obj_var = ('@' + class_str).to_sym

    obj_value = case action_name
                when 'index'
                  filter_by_mall ? model_to_save.where(mall: current_mall) : model_to_save.all
                when 'show', 'edit', 'update', 'destroy'
                  model_to_save.find params[:id]
                when 'new'
                  model_to_save.new
                when 'create'
                  attrs = params[class_str.to_sym]
                  attrs.merge!({ mallid: current_mall.id }) if filter_by_mall
                  model_to_save.new attrs
                end
   
    [obj_var, obj_value]
  end
end