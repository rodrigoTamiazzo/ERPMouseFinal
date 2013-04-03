class ApplicationController < ActionController::Base
  protect_from_forgery

  	rescue_from CanCan::AccessDenied do |exception|
  		flash[:error] = "Acesso Negado."
  		redirect_to root_url
	end

	def current_ability
  		@current_ability ||= Ability.new(current_usuario)
	end
end
