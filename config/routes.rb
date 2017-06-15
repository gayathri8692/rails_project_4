Rails.application.routes.draw do
  resources :photos
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  
  get '/about', to: 'welcome#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       registrations#new
#   edit_user_registration GET    /users/edit(.:format)          registrations#edit
#        user_registration PATCH  /users(.:format)               registrations#update
#                          PUT    /users(.:format)               registrations#update
#                          DELETE /users(.:format)               registrations#destroy
#                          POST   /users(.:format)               registrations#create
#                    users GET    /users(.:format)               users#index
#                          POST   /users(.:format)               users#create
#                 new_user GET    /users/new(.:format)           users#new
#                edit_user GET    /users/:id/edit(.:format)      users#edit
#                     user GET    /users/:id(.:format)           users#show
#                          PATCH  /users/:id(.:format)           users#update
#                          PUT    /users/:id(.:format)           users#update
#                          DELETE /users/:id(.:format)           users#destroy
#                   photos GET    /photos(.:format)              photos#index
#                          POST   /photos(.:format)              photos#create
#                new_photo GET    /photos/new(.:format)          photos#new
#               edit_photo GET    /photos/:id/edit(.:format)     photos#edit
#                    photo GET    /photos/:id(.:format)          photos#show
#                          PATCH  /photos/:id(.:format)          photos#update
#                          PUT    /photos/:id(.:format)          photos#update
#                          DELETE /photos/:id(.:format)          photos#destroy
#                    about GET    /about(.:format)               welcome#about
#                     root GET    /                              welcome#index