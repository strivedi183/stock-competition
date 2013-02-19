class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  def new
    @portfolio = Portfolio.new
  end
  def create
    portfolio = Portfolio.create(params[:portfolio])
    redirect_to(portfolio)
  end
  def show
    @portfolio = Portfolio.find(params[:id])
  end
  def edit
    @portfolio = Portfolio.find(params[:id])
  end
  def update
    portfolio = Portfolio.find(params[:id])
    portfolio.update_attributes(params[:portfolio])
    redirect_to(portfolio)
  end
  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.delete
    redirect_to(portfolios_path)
  end
  def buy_shares
    portfolio_id = params[:id]
    symbol = params[:symbol]
    number_of_shares = params[:number_of_shares]
    number_of_shares = number_of_shares.to_f
    portfolio = Portfolio.find(params[:id])
    share_price = Stock.quote(symbol)
    total_price = number_of_shares * share_price
    if portfolio.stocks.where(:symbol => symbol) == []
      if total_price <= portfolio.cash_balance.to_f
        stock = Stock.create(:symbol => symbol, :number_of_shares => number_of_shares)
        portfolio.stocks << stock
      end
      portfolio.cash_balance = portfolio.cash_balance - total_price
      portfolio.save
    else
      if total_price <= portfolio.cash_balance.to_f
        stock = Stock.create(:symbol => symbol, :number_of_shares => number_of_shares)
        portfolio.stocks << stock
      end
      stock = portfolio.stocks.where(:symbol => symbol).first
      stock.number_of_shares = stock.number_of_shares.to_f + number_of_shares
      stock.save
      portfolio.cash_balance = portfolio.cash_balance - total_price
      portfolio.save
    end
    redirect_to(users_path)
  end
  def sell_shares
    portfolio_id = params[:id]
    symbol = params[:symbol]
    number_of_shares = params[:number_of_shares]
    number_of_shares = number_of_shares.to_f
    portfolio = Portfolio.find(params[:id])
    share_price = Stock.quote(symbol)
    total_price = number_of_shares * share_price
    if portfolio.stocks.where(:symbol => symbol).first != 'nil'
      stock = portfolio.stocks.where(:symbol => symbol).first
      if stock.number_of_shares.to_f <= number_of_shares
      stock.number_of_shares = stock.number_of_shares.to_f - number_of_shares
      end
      stock.save
      if stock.number_of_shares.to_f == 0
      stock.delete
      end
      portfolio.cash_balance = portfolio.cash_balance + total_price
      portfolio.save
    end
    redirect_to(users_path)
  end
end