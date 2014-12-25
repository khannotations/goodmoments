class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      unless user.active
        photo_url = auth.extra.raw_info.picture.sub('?sz=50', '?sz=200')
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.photo_url = photo_url
        user.save!
      end
      user
    else
      # Return stub user that isn't persisted; not logged in
      User.new
    end
  end
end
