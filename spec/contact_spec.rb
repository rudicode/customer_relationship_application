require_relative '../lib/contact'

describe Contact do
  before :each do
  	@first_name = "Homer"
    @last_name = "Simpson"
    @email = "homer@home.com"
    @notes = "Likes duff"
  	@contact = Contact.new @first_name, @last_name, @email, @notes
  end

  it "should allow access to data" do
    expect(@contact.first_name).to eq @first_name
    expect(@contact.last_name).to be @last_name
    expect(@contact.email).to be @email
    expect(@contact.notes).to be @notes
  end

  it "should return full_name" do
    expect(@contact.full_name).to eq "#{@first_name} #{@last_name}"
  end

end
