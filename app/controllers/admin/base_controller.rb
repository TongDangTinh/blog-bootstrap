class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :admin_user
  before_action :set_locale

  layout "layouts/admin"

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
