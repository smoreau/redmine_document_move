# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  get 'documents/:id/move', :to => 'documents#move', :as => 'move_document'
end
