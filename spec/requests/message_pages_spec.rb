require 'spec_helper'

describe "Message Pages" do
  
  subject { page }

  describe "Feedback page" do
    before { visit feedback_path }
    let(:page_title) { 'Feedback' }
    let(:heading)    { 'Feedback' }

    it { should have_title(full_title(page_title)) }
    it { should have_selector('h1', text: heading) }
  end
end
