class StoresController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @stores = Store.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Store.create(store_params)
    redirect_to :root
  end

  private
  def store_params
    params.permit(:store_name, :c_card, :e_money)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
