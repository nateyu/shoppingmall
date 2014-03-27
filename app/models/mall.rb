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
      output   = Rails.root.join('packages')
      output_file = output.join("mall_#{mallid}_#{Time.now.to_i}.tar.gz")
      jar_file = Rails.root.join('bin', 'pack', 'pack.jar')

      FileUtils.mkdir_p images
      FileUtils.mkdir_p Rails.root.join('packages')
      FileUtils.rm Dir.glob(output.join("mall_#{mallid}_*.tar.gz")), :force => true
      system("java -jar #{jar_file} -db #{database} -user #{username} -pass #{password} -mall #{mallid} -image #{images}  -output #{output_file}")
    rescue Exception => e
      Rails.logger.info '=== pack resources failed ===='
      Rails.logger.info e
      return false
    end
  end

  def get_latest_resources
    mallid   = self['id']
    Dir.glob Rails.root.join("packages", "mall_#{mallid}_*.tar.gz")
  end
end
