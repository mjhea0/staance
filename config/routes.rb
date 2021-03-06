PoliticalKickstarter::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  post '/campaigns/editable_form' => "campaigns#editable_form"
  post '/campaigns/finalize_campaign' => "campaigns#finalize_campaign"
  put '/campaigns/finalize_campaign' => "campaigns#finalize_campaign"
  put '/campaigns/toggle_status' => "campaigns#toggle_status"
  post '/campaigns/support' => "campaigns#support"
  put '/campaigns/unsupport' => "campaigns#unsupport"
  get '/campaigns/check_support' => "campaigns#check_support"

  devise_for :users, controllers: {:omniauth_callbacks => 'authentications', 
                                   :registrations => 'registrations',
                                   :sessions => 'sessions',
                                   :passwords => 'passwords'}
  resources :users, only: [:show]
  resources :campaigns do
    resources :matchers
  end
  # resources :topics, only: [:index]

  # resources :campaign_users, only: :create
  post '/donate' => "stripe#donate"
  get '/add_cc' => "stripe#add_cc"
  post '/process_card' => "stripe#process_card"
  get '/' => "home#index"
  post '/filter_topic/:topic' => "campaigns#filter_topic"
  get '/multiauth' => "users#multiauth"
  post '/home/filter' => "home#filter"

  # get 'tags/:tag', to: 'campaigns#index', as: :tag  ==>  uncomment to enable search by tags
  root :to => "home#index"
end
