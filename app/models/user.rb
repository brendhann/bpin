class User < ActiveRecord::Base
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable, :omniauthable, 
	         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook]
	  has_many :pins
	  
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, 
	 :default_url => "/images/:style/missing.png",  
	 :path => ":rails_root/public/images/:style/:filename",
	 :url => "/images/:style/:filename" 
	validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\Z/ }

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
   
  end
end

	def password_required?
		super && provider.blank?
	end

end

