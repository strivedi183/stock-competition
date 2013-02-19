# == Schema Information
#
# Table name: portfolios
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  cash_balance :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Portfolio < ActiveRecord::Base
  attr_accessible :name, :cash_balance
  belongs_to :user
  has_many :stocks

  # def buy_stock(symbol, number_of_shares)
  #   if Stock.where(:name => symbol).nil?
  #     Stock.new(symbol, number_of_shares)
  #   else
  #     Stock.buy(symbol, number_of_shares)
  #   end
  # end

  # def sell_stock(symbol, shares)
  #   @stocks[symbol].sell(shares) if @stocks[symbol]
  # end

  def position
    portfolio.stocks.each do |i|
      portfolio_value = portfolio_value + i.number_of_shares.to_f * Stock.quote(i.symbol)
    end
  end
end
