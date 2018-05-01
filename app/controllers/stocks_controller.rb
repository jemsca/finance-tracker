class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock.nil?
        flash.now[:danger] = "No results found"
      end
    else
      flash.now[:danger] = "Please enter a search string"
    end
    render partial: "users/result"
  end

end
