class Exchange::Setup

  attr_accessor :exchange_id, :exchange

  def initialize(params)
    @exchange_id = params[:exchange_id]
    @exchange = Exchange.find(params[:exchange_id])
  end

  def assign_gifters
    users = exchange.group.users
    ids = users.map(&:id)
    users.each do |user|
      possible_ids = ids.select { |x| x != user.id }
      giftee_id = possible_ids.sample
      Gifting.create(exchange_id: exchange_id, gifter_id: user.id, giftee_id: giftee_id)
      ids.delete(giftee_id)
    end
  end

end
