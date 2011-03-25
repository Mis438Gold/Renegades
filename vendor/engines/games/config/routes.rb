Refinery::Application.routes.draw do
  resources :games, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :games, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
