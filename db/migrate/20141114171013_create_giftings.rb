class CreateGiftings < ActiveRecord::Migration
  def change
    create_table :giftings do |t|
      t.integer :exchange_id
      t.integer :giftee_id
      t.integer :gifter_id

      t.timestamps
    end
  end
end
