StockCompetition::Application.routes.draw do
  resources :users
  get '/portfolios' => 'portfolios#index'
  post '/portfolios' => 'portfolios#create'
  get '/portfolios/new' => 'portfolios#new', :as => 'new_portfolio'
  get '/portfolio/:id/edit' => 'portfolios#edit', :as => 'edit_portfolio'
  get '/portfolio/:id' => 'portfolios#show', :as => 'portfolio'
  put '/portfolio/:id' => 'portfolios#update'
  delete '/portfolio/:id' => 'portfolios#destroy'
  post '/portfolio/buy' => 'portfolios#buy_shares'
  post '/portfolio/sell' => 'portfolios#sell_shares'
  get '/stocks' => 'stocks#index'
  post '/stocks' => 'stocks#create'
  get '/stock/new' => 'stocks#new', :as => 'new_stock'
  get '/stock/:id/edit' => 'stocks#edit', :as => 'edit_stock'
  get '/stock/:id' => 'stocks#show', :as => 'stock'
  put '/stock/:id' => 'stocks#update'
  delete '/stock/:id' => 'stocks#destroy'
  get '/stocks/extended_quote' => 'stocks#extended_quote'
  root :to => 'users#index'
end
