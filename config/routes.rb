Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }

  root 'welcome#index'
  # root 'products#index'

  get '/about/', to:'fittings#about'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end

    resources :products do
      member do
        patch :move_up
        patch :move_down
        patch :move_top
        patch :move_bottom
      end
    end

    resources :fittings
  end

  resources :carts do
    collection do
      delete :clean
      post   :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :designs do
      collection do
        post :checkout
      end
    end
  end

  resources :fittings do
    member do
      post :add_to_custom_board
    end
  end

  resources :custom_boards do
    collection do
      delete :clean
    end
  end

  resources :custom_items
  resources :designs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
