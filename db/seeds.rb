User.destroy_all

user = User.create!(first_name: 'Katie', last_name: 'Astrauskas', email: 'Katharine322@gmail.com', password: 'sunkissed')
user.invite!
group = Group.create!(name: 'The Astrauskas Family', description: 'An awesome Lithuanian family')
Membership.create!(user_id: user.id, group_id: group.id)
Exchange.create!(name: 'Secret Santa 2014', signup_by: Date.today + 1.week, exchange_on: Date.today + 4.weeks, price_limit: 50, group_id: group.id)

