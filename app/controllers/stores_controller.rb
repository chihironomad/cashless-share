class StoresController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @stores = Store.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Store.create(store_name: store_params[:store_name], c_card: store_params[:c_card], e_money: store_params[:e_money], user_id: current_user.id)
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
