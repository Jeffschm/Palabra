PapiamentuBackend::Application.routes.draw do
  resources :pictures do
  post 'revert', :on => :member
end


  MODEL_TABS.each do |model|
    resources model.to_sym do
      post 'revert', :on => :member
    end
  end

  HIDDEN_MODELS.each do |model|
    resources model.to_sym do
      post 'revert', :on => :member
    end
  end

  
  devise_for :users, :path_prefix => 'auth'
  resources :users do
    post 'revert', :on => :member
  end

  INFO_TABS.each do |action|
    match "clients/#{action}/:id" => "clients##{action}"
  end

  PROCESS_TABS.each do |action|
    match "clients/#{action}/:id" => "clients##{action}"
  end

  match 'export' => 'words#export'
  root :to => 'words#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
