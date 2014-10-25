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

  def find_contact_by_id id
    found_contact = nil
    @contacts.each do |contact|
      found_contact = contact if contact.id == id
    end
    found_contact
  end

  def update_contact id, first_name, last_name, email, notes
    
    contact = find_contact_by_id id
    
    if contact
      contact.first_name = first_name
      contact.last_name  = last_name
      contact.email      = email
      contact.notes      = notes
    end
    
    contact
  end
end
