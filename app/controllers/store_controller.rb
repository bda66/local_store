class StoreController < ApplicationController
  def index
    @store =  Store.first
    @stores = Store.all.map { |store| [store.name, store.id] }
  end
end
