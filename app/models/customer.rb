class Customer < ActiveRecord::Base
  self.table_name = 'CUSTOMER'
  belongs_to :mall, foreign_key: 'mallid'
  belongs_to :customer_type, foreign_key: 'typeid'
  has_many  :goods, foreign_key: 'customerId'
  has_many  :activities, foreign_key: 'customerId'

  def logo1url=(upload)
    upload_file :logo1url, upload
  end

  # def logo2url=(upload)
  #   upload_file :logo2url, upload
  # end

  # def posterUrl=(upload)
  #   upload_file :posterUrl, upload
  # end

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
