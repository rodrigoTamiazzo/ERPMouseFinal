class LoginController < ApplicationController

	def signin 
		# @user = User.create(params[:username])
		@user = User.first
		sign_in(:user,@user)		
	end
end
