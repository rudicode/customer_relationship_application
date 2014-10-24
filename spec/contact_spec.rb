require_relative '../lib/contact'

describe Contact do
  before :each do
  	@first_name = "Homer"
    @last_name = "Simpson"
    @email = "homer@home.com"
    @notes = "Likes duff"
  	@contact = Contact.new @first_name, @last_name, @email, @notes
  end

  it "should keep contact data" do
  	expect(@contact.first_name).to eq @first_name
  end

  it "should respond to id" do
  	# this spec needs to be moved to Rolodex and checked
  	# after a contact is created
  	expect(@contact.id).to_not be nil 
  end
end
