class Gifting < ActiveRecord::Base

  belongs_to :exchange
  belongs_to :giftee, class_name: 'User', foreign_key: 'giftee_id'
  belongs_to :gifter, class_name: 'User', foreign_key: 'gifter_id'

end
