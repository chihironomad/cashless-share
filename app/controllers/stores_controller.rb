class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    Store.create(store_params)
  end

  private
  def store_params
    params.permit(:store_name, :c_card, :e_money)
  end
end
