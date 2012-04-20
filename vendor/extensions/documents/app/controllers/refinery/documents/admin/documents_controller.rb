module Refinery
  module Documents
    module Admin
      class DocumentsController < ::Refinery::AdminController

        crudify :'refinery/documents/document', :xhr_paging => true

      end
    end
  end
end
