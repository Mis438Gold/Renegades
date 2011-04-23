Refinery::Application.routes.draw do
  resources :events, :only => [:index, :show, :create]

# need to figure out how to handle the post from event buttons

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :events, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
