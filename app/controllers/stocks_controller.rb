class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end
  def new
    @stock = Stock.new
  end
  def create
    stock = Stock.create(params[:stock])
    redirect_to(stock)
  end
  def show
    @stock = Stock.find(params[:id])
  end
  def edit
    @stock = Stock.find(params[:id])
  end
  def update
    stock = Stock.find(params[:id])
    stock.update_attributes(params[:stock])
    redirect_to(stock)
  end
  def destroy
    stock = Stock.find(params[:id])
    stock.delete
    redirect_to(stocks_path)
  end
  def extended_quote
    @symbol = params[:symbol]
    render 'stocks/extended_quote'
  end
end