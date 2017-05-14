class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, 
 :default_url => "/images/:style/missing.png",  
 :path => ":rails_root/public/images/:style/:filename",
 :url => "/images/:style/:filename" 
validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\Z/ }
end

