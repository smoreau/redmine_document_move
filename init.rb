$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'documents_helper_patch'
require 'documents_controller_patch'

# Little hack for deface in redmine:
# - redmine plugins are not railties nor engines, so deface overrides are not detected automatically
# - deface doesn't support direct loading anymore ; it unloads everything at boot so that reload in dev works
# - hack consists in adding "app/overrides" path of the plugin in Redmine's main #paths
Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

Redmine::Plugin.register :redmine_document_move do
  name 'Move Document plugin'
  author 'Stephane Moreau'
  description 'A plugin which allows to move documents from a project to another.'
  version '0.1.0'
  url 'https://github.com/smoreau/redmine_document_move'
  author_url 'http://www.logikdev.com'

  project_module :documents do
    permission :move_documents, {:documents => [:move]}, :require => :loggedin
  end
end
