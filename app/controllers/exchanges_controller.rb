class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exchanges = []
    current_user.groups.each do |group|
      group.exchanges.each do |exchange|
        @exchanges.push(exchange)
      end
    end
  end

  def show
    @exchange = Exchange.find(params[:id])
    @giftee = current_user.exchange_giftee(params[:id])
    @gifter = current_user.exchange_gifter(params[:id])
  end

  def create
    @exchange = Exchange.new(name: params[:name], signup_by: params[:signup_by], exchange_on: params[:exchange_on], price_limit: params[:price_limit], group_id: params[:group_id])
    respond_to do |format|
      if @exchange.save
        @exchange.setup
        format.html { redirect_to @exchange, notice: 'Exchange created!' }
        format.json { render json: @exchange }
      else
        format.html { render :new }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

end
