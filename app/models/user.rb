class User < ActiveRecord::Base
  has_secure_password

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
