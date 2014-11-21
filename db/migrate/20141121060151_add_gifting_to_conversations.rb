class AddGiftingToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :gifting_id, :integer
  end
end
