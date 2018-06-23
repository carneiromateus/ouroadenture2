class RegistrationsController < Devise::RegistrationsController
  before_filter :is_administrator?, only: [:new, :create]
  skip_before_filter :require_no_authentication
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  private

  def is_administrator? 	
    if user_signed_in? 
  	  true
  	else
  	  flash[:alert] = "Faça login para ter acesso a esta área"
  	  redirect_to new_user_session_path
  	end
  end 
  def sign_up(resource_name, resource)
    true
  end
end 