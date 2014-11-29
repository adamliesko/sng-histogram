Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  resources :artists, only: [:index, :show] do


    resources :eras, only: [:index, :show, :aggregated]
  end
  get 'aggregated_histogram/', to: 'eras#aggregated'
  get 'selected_histogram/', to: 'eras#selected'
end
