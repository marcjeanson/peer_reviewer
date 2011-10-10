class User < ActiveRecord::Base
  has_secure_password

  validates :password, :presence => {:on => :create}

  def self.authenticate_for_username(username, password)
    user = self.where("username = ?", username).first.try(:authenticate, password)
    user.nil? ? false : user
  end

end
