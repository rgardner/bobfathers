require "active_attr/rspec"

describe Message do
  
  before do
    @message = Message.new(name: "Anonymous", email: "user@example.com",
                           subject: "Example Subject",
                           content: "a" * 31)
  end

  subject { @message }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subject) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when name is not present" do
    before { @message.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @message.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @message.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @message.email = invalid_address
        expect(@message).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @message.email = valid_address
        expect(@message).to be_valid
      end
    end
  end

  describe "subject is not present" do
    before { @message.subject = " " }
    it { should_not be_valid }
  end

  describe "content is not present" do
    before { @message.content = " " }
    it { should_not be_valid }
  end

  describe "content is too short" do
    before { @message.content = "a" * 29 }
    it { should_not be_valid }
  end
end