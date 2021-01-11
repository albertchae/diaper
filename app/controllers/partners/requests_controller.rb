module Partners
  class RequestsController < ApplicationController
    layout 'partners/application'

    protect_from_forgery with: :exception

    # Prevent using the user for diaperbase for authentication
    skip_before_action :authenticate_user!
    skip_before_action :authorize_user

    def index
      @partner = current_partner_user.partner
      @partner_requests = @partner.requests.order(created_at: :desc).limit(10)
    end

    def new
      @partner_request = Partners::Request.new
      @partner_request.item_requests.build

      # Fetch the valid items
      @requestable_items = Organization.find(current_partner_user.partner.diaper_bank_id).valid_items.map do |item|
        [item[:name], item[:id]]
      end.sort
    end

  end
end

