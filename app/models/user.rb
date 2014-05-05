class User < ActiveRecord::Base
  def self.from_auth(auth)
    User.where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email =  auth.info.email
      user.avatar = auth.info.image
    end
  end
end
