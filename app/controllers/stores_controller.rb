class StoresController < ApplicationController
  before_action :move_to_index, except: [:index, :search]

  def index
    @stores = Store.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.create(store_name: store_params[:store_name], c_card: store_params[:c_card], e_money: store_params[:e_money], user_id: current_user.id)
    if @store.save
      redirect_to :root
    else
      render("stores/new")
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.update(store_params)
    if @store.save
    else
      render("stores/edit")
    end
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
  end

  def search
    @stores = Store.where('store_name LIKE(?)', "%#{(params[:keyword])}%").limit(10)
  end

  private
  def store_params
    params.permit(:store_name, :c_card, :e_money)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
