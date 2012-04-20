Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :documents do
    resources :documents, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :documents, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :documents, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
