class StocksController < ApplicationController

  def search

    if params[:stock].present?
      begin
        @stock = Stock.new_lookup(params[:stock])
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      rescue => exception

        respond_to do |format|
          flash.now[:alert] = 'Invalid Ticker'
          format.js { render partial: 'users/result' }
        end
      end

    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/result' }
      end
    end
  end
end
