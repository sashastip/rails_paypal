class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total_amount_cents
      t.datetime :purchased_at
    end
  end
end
