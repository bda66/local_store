class StoreController < ApplicationController
  before_action :set_store, only: :index

  def index
    @stores = Store.all.map { |store| [store.name, store.id] }

    respond_to do |format|
      format.js   { render 'index.js.erb' }
      format.html {}
    end
  end

  private

  def set_store
    if params[:selected_store]
      @store = Store.find(params[:selected_store][:store_id])
    else
      @store =  Store.first
    end
  end
end
