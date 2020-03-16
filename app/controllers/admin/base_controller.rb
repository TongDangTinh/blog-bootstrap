class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  layout "layouts/admin"

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
