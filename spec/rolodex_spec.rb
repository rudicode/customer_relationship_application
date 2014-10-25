require_relative '../lib/rolodex'

describe Rolodex do
  before :each do
    @rolodex_name = "my rolodex"
    @rolodex = Rolodex.new @rolodex_name
  end

  it "should have a name" do
    expect(@rolodex.name).to eq @rolodex_name
  end

  describe "add_contact" do
    before :each  do
      @first_name = "Homer"
      @last_name = "Simpson"
      @email = "homer@home.com"
      @notes = "Likes duff"
    end

    it "should add new contact" do
      expect do
        @rolodex.add_contact @first_name, @last_name, @email, @notes
      end.to change{@rolodex.contacts.length}.by(1)
    end

    it "should add the correct contact" do
      @rolodex.add_contact @first_name, @last_name, @email, @notes
      expect(@rolodex.contacts.last.first_name).to be @first_name
      expect(@rolodex.contacts.last.last_name).to be @last_name
      expect(@rolodex.contacts.last.email).to be @email
      expect(@rolodex.contacts.last.notes).to be @notes
    end

    it "should increment the contact index" do
      expect do 
        @rolodex.add_contact @first_name, @last_name, @email, @notes
      end.to change{@rolodex.index}.by(1)
    end

  end

  describe "have all contacts" do

  end
end
