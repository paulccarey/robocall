Rails.application.routes.draw do
  resource :robocall, :only => [:connected_to_caller] do
    post '/:id/:token' => 'robocall/robocalls#connected_to_caller', :defaults => {:format => 'xml'}
  end
end
