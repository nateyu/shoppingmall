class Mall < ActiveRecord::Base
  self.table_name = 'MALL'
  has_many  :users, foreign_key: 'mallid'
  has_many  :gateways, foreign_key: 'mallid'
  has_many  :activities, foreign_key: 'mallid'
  has_many  :customers, foreign_key: 'mallid'
  has_many  :customer_types, foreign_key: 'mallid'
  has_many  :good_types, foreign_key: 'mallid'
  has_many  :goods, foreign_key: 'mallid'
  has_many  :homepagelocs, foreign_key: 'mallid'

  def pack_resources
    begin
      config   = Rails.configuration.database_configuration[Rails.env]
      database = config["database"]
      username = config["username"]
      password = config["password"]
      mallid   = self['id']
      images   = Rails.root.join('public', 'images')
      output   = Rails.root.join('packages', "mall_#{mallid}_#{Time.now.to_i}.tar.gz")
      jar_file = Rails.root.join('bin', 'pack', 'pack.jar')

      FileUtils.mkdir_p images
      FileUtils.mkdir_p Rails.root.join('packages')
      system("java -jar #{jar_file} -db #{database} -user #{username} -pass #{password} -mall #{mallid} -image #{images}  -output #{output}")
    rescue Exception => e
      Rails.logger.info '=== pack resources failed ===='
      Rails.logger.info e
      return false
    end
  end
end
