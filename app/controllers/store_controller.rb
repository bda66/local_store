class StoreController < ApplicationController
  DISTANCE = 300.freeze

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
    if params[:position]
      @store = Store.near([params[:position][:latitude], params[:position][:longitude]], DISTANCE).first
    elsif params[:selected_store]
      @store = Store.find(params[:selected_store][:store_id])
    elsif cookies[:selected_store_id]
      @store = Store.find(cookies[:selected_store_id])
    else
      @store = Store.first
    end
  end
end
