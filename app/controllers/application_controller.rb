class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :configure_permited_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

	private
	def configure_permited_parameters
		devise_parameter_sanitizer.for(:sign_up) << :name
	end
end
