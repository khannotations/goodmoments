class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  # Add omniauthable to login with Google
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :posts, dependent: :destroy

  # For emailing users
  def pretty_email
    "#{first_name} #{last_name} <#{email}>"
  end

  # Method necessary for omniauth gem, with Devise. 
  def self.from_omniauth(auth)
    if user = User.find_or_initialize_by(email: auth.info.email)
      photo_url = auth.extra.raw_info.picture.sub('?sz=50', '?sz=200')
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
      user.photo_url = auth.extra.raw_info.picture # photo_url
      user.save!
    end
    user
  end

  def self.remind_all
    where(email_reminder: true).each do |user|
      UserMailer.remind(user).deliver!
    end
  end
end
