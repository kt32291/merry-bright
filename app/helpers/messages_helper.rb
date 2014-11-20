module MessagesHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end

  def display_name(exchange_id, user)
    if current_user.exchange_gifter(exchange_id) == user
      "Secret Santa"
    else
      user.first_name + " " + user.last_name
    end
  end

end
