Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :banks, except: [ :show, :destroy ] do
      put :toggle_activation, on: :member
    end
  end

  resources :payments, only: :update

  get '/content/bank_transfer', to: 'pages#bank_transfer', as: :bank_transfer_instructions
end
