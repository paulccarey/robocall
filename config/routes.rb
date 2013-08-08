Rails.application.routes.draw do
  resource :robocall, :only => [:connected_to_caller] do
    post '/:call_id/:token' => 'robocall#connected_to_caller'
  end
end
