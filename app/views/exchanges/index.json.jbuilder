json.array! @exchanges do |exchange|
  json.id exchange.id
  json.name exchange.name
  json.signup_by exchange.signup_by
  json.exchange_on exchange.exchange_on
  json.price_limit exchange.price_limit
end
