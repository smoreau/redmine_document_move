require_dependency 'documents_helper'

# Patches Redmine's Documents Helper dynamically.
# http://www.redmine.org/projects/redmine/wiki/Plugin_Internals#Adding-a-new-method

module DocumentsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def project_select_tag(project)
      options = ''
      options << project_tree_options_for_select(Project.active.all, :selected => project)
      content_tag('select', options.html_safe, :name => 'document[project_id]', :id => 'document_project_id')
    end    
  end
end

DocumentsHelper.send(:include, DocumentsHelperPatch)
