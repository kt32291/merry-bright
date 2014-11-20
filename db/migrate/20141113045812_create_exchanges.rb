class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :name
      t.date :signup_by
      t.date :exchange_on
      t.integer :price_limit

      t.timestamps
    end
  end
end
