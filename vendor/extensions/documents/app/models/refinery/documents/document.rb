module Refinery
  module Documents
    class Document < Refinery::Core::BaseModel
      self.table_name = 'refinery_documents'     
      CATEGORIES = ["Early History", "Major Contributors", "National Hay Fever Association", "BHC Sisterhood", "Other"]
      DOCTYPES = ["Newspaper", "Photo", "Minutes", "Other"]
    
      acts_as_indexed :fields => [:title, :category, :subject, :doctype, :description, :source]

      validates :title, :presence => true, :uniqueness => true
      validates :category, :inclusion => {:in => CATEGORIES}
      validates :doctype, :inclusion => {:in => DOCTYPES}
          
      attr_accessible :title, :doctype, :category, :subject, :date, :source, :description
      
      has_many_page_images
    end
  end
end
