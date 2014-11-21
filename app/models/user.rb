class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :group_exchanges, through: :groups, source: :exchanges
  has_many :conversations, foreign_key: :sender_id

  def pending?
    !active?
  end

  def gifting_where_gifter_for_exchange(exchange_id)
    Gifting.find_by_exchange_id_and_gifter_id(exchange_id, id)
  end

  def gifting_where_giftee_for_exchange(exchange_id)
    Gifting.find_by_exchange_id_and_giftee_id(exchange_id, id)
  end

  def exchange_gifter(exchange_id)
    gifting_where_giftee_for_exchange(exchange_id).gifter
  end

  def exchange_giftee(exchange_id)
    gifting_where_gifter_for_exchange(exchange_id).giftee
  end

end
