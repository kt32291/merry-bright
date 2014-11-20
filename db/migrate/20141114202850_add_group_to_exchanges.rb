class AddGroupToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :group_id, :integer
  end
end
