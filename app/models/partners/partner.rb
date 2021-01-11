module Partners
  class Partner < ApplicationRecord
    establish_connection :partners

    has_one :user
    has_many :requests
    has_many :families
    has_many :children, through: :families

    def verified?
      partner_status == "verified"
    end
  end
end

