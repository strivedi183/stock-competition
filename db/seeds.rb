User.delete_all
Portfolio.delete_all
Stock.delete_all

u1 = User.create(:name => 'Bob', :password => 'user1')
u2 = User.create(:name => 'Clyde', :password => 'user2')
u3 = User.create(:name => 'Roger', :password => 'user3')

p1 = Portfolio.create(:name => 'Aggressive', :cash_balance => 100000)
p2 = Portfolio.create(:name => 'Tech Heavy', :cash_balance => 100000)
p3 = Portfolio.create(:name => 'Risk Averse', :cash_balance => 100000)
p4 = Portfolio.create(:name => 'Biotech', :cash_balance => 100000)
p5 = Portfolio.create(:name => 'Go for Broke', :cash_balance => 100000)
p6 = Portfolio.create(:name => 'College Fund', :cash_balance => 100000)
p7 = Portfolio.create(:name => 'Retirement', :cash_balance => 100000)
p8 = Portfolio.create(:name => 'Hail Mary', :cash_balance => 100000)

u1.portfolios << p1 << p3 << p5
u1.save

u2.portfolios << p2 << p4 << p7
u2.save

u3.portfolios << p6 << p8
u3.save
