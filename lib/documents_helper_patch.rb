require_dependency 'documents_helper'

# Patches Redmine's Documents dynamically.
# http://www.redmine.org/projects/redmine/wiki/Plugin_Internals#Adding-a-new-method

module DocumentsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def project_select_tag(project)
      selected = project.parent
      # retrieve the requested parent project
      parent_id = (params[:project] && params[:project][:parent_id]) || params[:parent_id]
      if parent_id
        selected = (parent_id.blank? ? nil : Project.find(parent_id))
      end

      options = ''
      options << "<option value=''>&nbsp;</option>" if project.allowed_parents.include?(nil)
      #options << project_tree_options_for_select(project.allowed_parents.compact, :selected => selected)
      options << project_tree_options_for_select(Project.active.all, :selected => selected)
      content_tag('select', options.html_safe, :name => 'project[parent_id]', :id => 'project_parent_id')
    end    
  end
end

DocumentsHelper.send(:include, DocumentsHelperPatch)
