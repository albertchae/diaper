module Partners
  class Family < Base
    belongs_to :partner

    has_many :children
  end
end

