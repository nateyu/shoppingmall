class User < ActiveRecord::Base
  self.table_name = 'USERS'
  belongs_to :mall, foreign_key: 'mallid'
  has_secure_password

  ROLES = {admin: '管理员', customer: '商家'}
  
  def self.authenticate? username, password
    User.find_by(name: username).try(:authenticate, password)
  end

  def admin?
    self.role.eql? 'admin'
  end
  
  def customer?
    self.role.eql? 'customer'
  end
end
