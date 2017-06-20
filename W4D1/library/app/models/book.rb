class Book < ActiveRecord::Base
  resources :books, only: [:new, :create, :index, :destroy]
end
