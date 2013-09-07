require 'spec_helper'

describe Idea do

  before do
    @idea = Idea.new(title: "Example Idea", description: 'a' * 11,
                     suggested_by: "abc123@nyu.edu")
  end

  subject { @idea }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:suggested_by) }
  it { should respond_to(:admin_notes) }
  it { should respond_to(:status) }

  it { should be_valid }

  describe "when title is not present" do
    before { @idea.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @idea.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @idea.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @idea.description =  "a" * 9 }
    it { should_not be_valid }
  end

  describe "when suggested_by is not present" do
    before { @idea.suggested_by = " " }
    it { should_not be_valid }
  end

  describe "when suggested_by format is invalid" do
    it "should be invalid" do
      addresses = %w[user@nyu,edu user_at_nyu.edu example.user@nyu.
                     foo@nyu_cas.edu foo@nyu_cas.com foo@nyu..edu]
      addresses.each do |invalid_address|
        @idea.suggested_by = invalid_address
        expect(@idea).not_to be_valid
      end
    end
  end

  describe "when suggested_by format is valid" do
    it "should be valid" do
      addresses = %w[usr000@nyu.EDU aza999@NYU.edu]
      addresses.each do |valid_address|
        @idea.suggested_by = valid_address
        expect(@idea).to be_valid
      end
    end
  end

  describe "when suggested_by format is mixed case" do
    let(:mixed_case_email) { "Foo123@NyU.EdU" }

    it "should be saved as all lowercase" do
      @idea.suggested_by = mixed_case_email
      @idea.save
      expect(@idea.reload.suggested_by).to eq mixed_case_email.downcase
    end
  end

  describe "status" do
    before { @idea.save }
    its(:status) { should eq Idea::STATUSES[:pending] }
  end
end
