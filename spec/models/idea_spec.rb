require 'spec_helper'

describe Idea do

  before do
    @idea = Idea.new(title: "Example Idea", description: "Example description",
                     suggested_by: "anonymous")
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

  describe "when suggested_by is not present" do
    before { @idea.suggested_by = " " }
    it { should_not be_valid }
  end

  describe "status" do
    before { @idea.save }
    its(:status) { should eq Idea::STATUSES[:pending] }
  end
end
