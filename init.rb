require 'documents_helper_patch'

Redmine::Plugin.register :redmine_document_move do
  name 'Move Document plugin'
  author 'Stephane Moreau'
  description 'A plugin which allows to move documents from a project to another.'
  version '0.0.1'
  url 'https://github.com/smoreau/redmine_document_move'
  author_url 'http://www.logikdev.com'

  project_module :documents do
    permission :move_documents, {:documents => [:move]}, :require => :loggedin
  end
end
