class AddStocksTable < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :number_of_shares
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
