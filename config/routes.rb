Rails.application.routes.draw do
  resources :stores
   root 'store#index'
   match  'newstore' => 'stores#newstore',:via => :post 
   match  '/getstores' => 'stores#getstores', :via => :post
 
end
