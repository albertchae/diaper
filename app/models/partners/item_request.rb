# == Schema Information
#
# Table name: item_requests
#
#  id                 :bigint           not null, primary key
#  name               :string
#  partner_key        :string
#  quantity           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  item_id            :integer
#  partner_request_id :bigint
#
module Partners
  class ItemRequest < Base
    self.table_name = "item_requests"

    # Notes - How will be make this work nicely with the Items that
    # we do have in the diaper app.
  end
end
