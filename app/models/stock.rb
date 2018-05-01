class Stock < ActiveRecord::Base
  
  def self.new_from_lookup(ticker_symbol)
    begin
      found_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: found_stock.company_name, 
        ticker: found_stock.symbol, 
        last_price: found_stock.latest_price
      )
    rescue Exception => e
      return nil
    end
  end

end
