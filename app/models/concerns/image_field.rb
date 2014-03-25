module ImageField
  extend ActiveSupport::Concern
  
  module ClassMethods
    def image_field(*fields)
      define_method(:get_image_fields) {
        return fields
      }
      before_save :save_image_fields
    end
  end

  private
  def save_image_fields
    get_image_fields.each do |field|
      upload_file(field, self[field])
    end
  end

  def upload_file(field, upload)
    unless upload.nil?
      content = upload.read
      name = Digest::MD5.hexdigest(content) + sanitize_filename(upload.original_filename)
      
      path = Rails.root.join('public', 'uploads', name)
      # write the file
      unless File.exist? path
        File.open(path, 'wb') { |f| f.write(content) }  
      end
    
      self[field] = File.join("/uploads", name)
    end 
  end

  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end
end