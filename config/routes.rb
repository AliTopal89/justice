Rails.application.routes.draw do

  get 'calendar_items/new'

  get 'calendar_items/create'

  get 'calendar_items/update'

  get 'calendar_items/edit'

  get 'calendar_items/destroy'

  get 'calendar_items/show'

  get 'calendar_items/index'

  comfy_route :cms_admin, :path => '/admin'

  resources :terms
  resources :lessons
  resources :calendar_items
  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
