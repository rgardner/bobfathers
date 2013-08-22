require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "Signin page" do
    before { visit signin_path }

    it { should have_title(full_title('Sign in')) }
    it { should have_selector('h1', text: 'Sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "bobfathers" }
        it { should_not have_selector('div.aler.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in(user) }

      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end