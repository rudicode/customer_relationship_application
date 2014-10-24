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
      @rolodex.add_contact @first_name, @last_name, @email, @notes
      # expectation here??
    end

    it "should incrament the contact index" do
      
      expect do 
        @rolodex.add_contact @first_name, @last_name, @email, @notes
      end.to change{@rolodex.index}.by(1)
    end
  end
end
