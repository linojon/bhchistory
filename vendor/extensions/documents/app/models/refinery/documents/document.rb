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
          
      belongs_to :image, :class_name => '::Refinery::Image'
        
    end
  end
end
