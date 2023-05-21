$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'documents_helper_patch'
require 'documents_controller_patch'

Redmine::Plugin.register :redmine_document_move do
  name 'Move Document plugin'
  author 'Stephane Moreau'
  description 'A plugin which allows to move documents from a project to another.'
  version '0.2.0'
  url 'https://github.com/smoreau/redmine_document_move'
  author_url 'http://www.logikdev.com'

  project_module :documents do
    permission :move_documents, {:documents => [:move]}, :require => :loggedin
  end
end
