class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?
  rescue_from ApplicationController::Forbidden, with: :rescue403
  rescue_from ApplicationController::IpAddressRejected, with: :rescue403

  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      'customer'
    end
  end

  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end
end