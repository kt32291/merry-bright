class Exchange < ActiveRecord::Base
  has_many :giftings
  belongs_to :group
  has_many :users, through: :group

  def setup
    Exchange::Setup.new(exchange_id: id).assign_gifters
  end

end
