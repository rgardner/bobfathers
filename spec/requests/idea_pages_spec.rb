require 'spec_helper'

describe "Idea Pages" do
  
  subject { page }

  shared_examples_for "all idea pages" do
    it { should have_title(full_title(page_title)) }
    it { should have_selector('h1', text: heading) }
  end

  describe "Index page" do
    before { visit root_path }
    let(:page_title) { 'Ideas' }
    let(:heading)    { 'Ideas' }

    it_should_behave_like "all idea pages"

    describe "pagination" do
      before(:all) do
        31.times { FactoryGirl.create(:idea) }
        visit root_path
      end

      after(:all) { Idea.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each idea" do
        Idea.paginate(page: 1).each do |idea|
          expect(page).to have_selector("li##{idea.id}", text: idea.title)
        end
      end
    end
  end

  describe "idea creation" do
    
    before { visit root_path }
    describe "with invalid information" do
      
      it "should not create an idea" do
        expect { click_button "Submit" }.not_to change(Idea, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      
      before do
        fill_in "idea_title",        with: "Example Idea"
        fill_in "idea_description",  with: "Example Description"
        fill_in "idea_suggested_by", with: "abc123@nyu.edu"
      end

      it "should create an idea" do
        expect { click_button "Submit" }.to change(Idea, :count).by(1)
      end
    end
  end
end
