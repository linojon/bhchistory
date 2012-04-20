module Refinery
  module Documents
    class Document < Refinery::Core::BaseModel
      self.table_name = 'refinery_documents'      
    
      acts_as_indexed :fields => [:title, :category, :subject, :doctype, :description, :source]

      validates :title, :presence => true, :uniqueness => true
          
      belongs_to :image, :class_name => '::Refinery::Image'
        
    end
  end
end
