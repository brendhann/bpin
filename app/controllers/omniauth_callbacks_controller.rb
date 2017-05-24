class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		@user = User.from_omniauth(request.env["omniauth.auth"])
		if @user.persisted?
			sign_in_and_redirect @user, notice: "Signed In!"
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end
	alias_method :facebook, :all
	
	def failure
		redirect_to root_path
	end
end
