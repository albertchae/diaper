module Partners
  class DashboardsController < ApplicationController
    layout 'partners/application'

    protect_from_forgery with: :exception

    # Prevent using the user for diaperbase for authentication
    skip_before_action :authenticate_user!
    skip_before_action :authorize_user

    def index; end

    def show
      @partner = current_partner_user.partner
      @partner_requests = @partner.requests.order(created_at: :desc).limit(10)
      @families = @partner.families
      @children = @partner.children
    end
  end
end
