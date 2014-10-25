class Rolodex
  attr_reader :name, :index, :contacts
  def initialize name
    @name = name
    @index = 501
    @contacts = []
  end

  def add_contact first_name, last_name, email, notes
    contact = Contact.new first_name, last_name, email, notes
    contact.id = @index
    @index += 1
    @contacts << contact
  end

end
