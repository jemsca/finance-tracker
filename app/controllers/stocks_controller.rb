class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if !@stock.nil?
        render "users/my_portfolio"
      else
        flash[:danger] = "No results found"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "Please enter a search string"
      redirect_to my_portfolio_path
    end
  end

end
