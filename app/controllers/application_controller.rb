class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # before_action :authenticate_user!
  # before_action :config_navbar

  before_action :authenticate_user!
  #before_action :config_navbar
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_logo, :_navbar

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
    #devise_parameter_sanitizer.for(:sign_up) << :username
    #devise_parameter_sanitizer.for(:account_update) << :username
  end

  def after_sign_in_path_for(resource)
    news_index_path
  end
  private
  def set_logo
    @logoatv = Logo.where(status: "ativo")
    if not Colaborator.first.nil? 
       @colaborator = Colaborator.first
    end
    if not Feira.first.nil?
      @feira = Feira.first
    end
    if not Conection.first.nil?
      @conection = Conection.first
    end
  end

  def _navbar
    @events = Event.all
    @eventos = Evento.all
    @oficinas = Oficina.all

  end
  
 
end