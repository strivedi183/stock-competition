class AddPortfoliosTable < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :cash_balance
      t.integer :user_id
      t.timestamps
    end
  end
end
