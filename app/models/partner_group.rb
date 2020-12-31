# == Schema Information
#
# Table name: partner_groups
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
class PartnerGroup < ApplicationRecord
  belongs_to :organization
  has_many :partner_group_memberships
  has_many :partners, through: :partner_group_memberships

  validates :organization, presence: true
  validates :name, presence: true, uniqueness: { scope: :organization }
end