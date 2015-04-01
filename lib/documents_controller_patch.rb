require_dependency 'documents_controller'

# Patches Redmine's Documents Controller dynamically.
# http://www.redmine.org/projects/redmine/wiki/Plugin_Internals#Adding-a-new-method

module DocumentsControllerPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

    base.send(:include, InstanceMethods)

    # Same as typing in the class
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def move
      if params[:document] && params[:document][:project_id]
        @document.update_attribute(:project_id, params[:document][:project_id])
        flash[:notice] = l(:notice_successful_move)
        redirect_to document_path(@document)
      end
    end
  end
end

DocumentsController.send(:include, DocumentsControllerPatch)
