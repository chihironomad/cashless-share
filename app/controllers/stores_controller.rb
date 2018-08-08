class StoresController < ApplicationController
  def index
    @store = Store.all
  end

  def new
  end
end
