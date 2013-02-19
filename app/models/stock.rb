# == Schema Information
#
# Table name: stocks
#
#  id               :integer          not null, primary key
#  symbol           :string(255)
#  number_of_shares :string(255)
#  portfolio_id     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Stock < ActiveRecord::Base
  attr_accessible :symbol, :number_of_shares
  belongs_to :portfolio

  def Stock.quote(symbol)
    YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
  end

  def Stock.extended_quote(symbol)
    @extended_quote = YahooFinance::get_extended_quotes(symbol)[symbol]
  end

  def buy(number_of_shares)
    @number_of_shares += number_of_shares
  end

  def sell(number_of_shares)
    @number_of_shares -= number_of_shares if number_of_shares <= @number_of_shares
  end
end
