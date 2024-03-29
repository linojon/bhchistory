# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Documents" do
    describe "Admin" do
      describe "documents" do
        login_refinery_user

        describe "documents list" do
          before(:each) do
            FactoryGirl.create(:document, :title => "UniqueTitleOne")
            FactoryGirl.create(:document, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.documents_admin_documents_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.documents_admin_documents_path

            click_link "Add New Document"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Documents::Document.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Documents::Document.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:document, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.documents_admin_documents_path

              click_link "Add New Document"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Documents::Document.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:document, :title => "A title") }

          it "should succeed" do
            visit refinery.documents_admin_documents_path

            within ".actions" do
              click_link "Edit this document"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:document, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.documents_admin_documents_path

            click_link "Remove this document forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Documents::Document.count.should == 0
          end
        end

      end
    end
  end
end
