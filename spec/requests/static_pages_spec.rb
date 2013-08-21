require 'spec_helper'

describe "Static Pages" do
  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }  
    it { should have_selector('h1', text: heading) }
  end

  describe "Blog page" do
    before { visit blog_path }
    let(:page_title) { 'Blog' }
    let(:heading)    { 'Blog' }

    it_should_behave_like "all static pages"
  end

  describe "Feedback page" do
    before { visit feedback_path }
    let(:page_title) { 'Feedback' }
    let(:heading)    { 'Feedback' }

    it_should_behave_like "all static pages"
  end
end
