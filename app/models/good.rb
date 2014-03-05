class Good < ActiveRecord::Base
  self.table_name = 'GOODS'
  belongs_to :goods_type, foreign_key: 'goodstypeId'
  belongs_to :customer, foreign_key: 'customerId'

  def goodspic1url= upload
    upload_file :goodspic1url, upload
  end

  def goodspic1ur2= upload
    upload_file :goodspic2url, upload
  end

  def goodspic1ur3= upload
    upload_file :goodspic3url, upload
  end

  def goodspic1ur4= upload
    upload_file :goodspic4url, upload
  end

  def goodspic1ur5= upload
    upload_file :goodspic5url, upload
  end

  private
  def upload_file(field, upload)
    unless upload.nil?
      name =  Digest::SHA1.hexdigest(upload.read) + sanitize_filename(upload.original_filename)
      # create the file path
      file = Rails.root.join('public', 'uploads', name)
      
      self[field] = File.join("/uploads", name)
      # write the file
      File.open(file, 'wb') { |f| f.write(upload.read) }
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
