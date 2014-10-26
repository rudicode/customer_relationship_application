class CRM

  def self.run name
    crm = CRM.new name
    crm.main_menu
  end

  def initialize name
    @name = name
    @rolodex = Rolodex.new "my rolodex"
    @notice = ""
  end

  def main_menu
    clear_screen
    while true
      display_menu
      input = get_input
      process_option input
      break if input == 7
    end
  end

  def display_menu
    menu = %{
      #{@notice}

      #{@name}

      [ 1 ] Add Contact
      [ 2 ] Modify Contact
      [ 3 ] Display All
      [ 4 ] Display Contact
      [ 5 ] Display Attribute
      [ 6 ] Delete Contact
      [ 7 ] Exit

    }

    clear_screen
    puts menu
    print "Choose an option: -> "
    clear_notice
  end

  def get_input
    gets.chomp().to_i
  end

  def process_option option
    # puts "Processing option: #{option}"
    case option
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_attribute
    when 6 then delete_contact
    when 99 then trigger_pry
    when 98 then add_a_bunch_of_contacts_so_i_dont_have_to_keep_typing_them_out
    else
      @notice = "#{option} is not a valid option."
    end
  end

  def add_contact
    clear_screen
    
    first_name, last_name, email, notes = get_contact_from_user "ADD CONTACT\n\n"
    
    @rolodex.add_contact first_name, last_name, email, notes

    wait_for_enter
    # no error checking yet, assume it was added.
    @notice = "#{first_name} #{last_name} added to contacts."

  end

  def display_all_contacts

    display_header
    
    @rolodex.contacts.each do |contact|

      puts columnize contact.id, contact.first_name, contact.last_name,
                     contact.email, contact.notes
      puts

    end
    puts "\nDisplayed #{@rolodex.contacts.count} contact(s)."
    wait_for_enter
  end

  def modify_contact
    display_all_contacts
    input_id = get_id_from_user "Enter the ID of the contact to edit."
    
    first_name, last_name, email, notes = get_contact_from_user "Edit Contact #{input_id}"
    
    contact = @rolodex.update_contact input_id, first_name, last_name, email, notes
    
    if contact
      @notice = "Contact #{input_id} was updated."
    else
      @notice = "Contact with ID #{input_id} does not exist."
    end

  end

  def display_contact message = "Enter the ID of the contact to display."
    input_id = get_id_from_user message
    contact = @rolodex.find_contact_by_id input_id
    
    unless contact
      @notice = "Contact with id: #{input_id} Does Not exist."
      return nil
    end

    display_header
    puts columnize contact.id, contact.first_name, contact.last_name,
                     contact.email, contact.notes
    puts

    wait_for_enter

    return input_id
    
  end

  def delete_contact
    contact_id = display_contact "Enter the ID of the contact to DELETE: "
    
    puts "Are you sure you want to delete this contact. y/n"
    if gets.chomp().to_s == "y"
      @rolodex.delete_contact contact_id
    end
  end

  def get_id_from_user message
    print "#{message} "
    input_id = gets.chomp().to_i
  end

  def get_contact_from_user message
    # routine to get the contact input from user.
    clear_screen
    puts "#{message}\n\n"

    print "First name: "
    first_name = gets.chomp().to_s

    print "Last name : "
    last_name = gets.chomp().to_s

    print "email     : "
    email = gets.chomp().to_s

    print "Notes     : "
    notes = gets.chomp().to_s
    return first_name, last_name, email, notes
  end

  private

    def self.stub(*names)
      # refactored with help from ...
      names.each do |name|
        define_method(name) do
          @notice = "#{self.class}##{name} Not implemented yet!!"
        end
      end
    end

  stub :display_attribute


    def clear_screen
      puts"\e[H\e[2J"
    end

    def wait_for_enter
      print"\nPress ENTER to continue."
      gets
    end

    def clear_notice
      @notice = ""
    end

    def display_header
      puts
      puts columnize " ID ", "First", "Last", "Email", "Notes"
      puts columnize "----", "-----", "----", "-----", "-----"
      puts
    end

    def trigger_pry
      # need to have the pry gem installed to use this
      # also the pry-byebug gem for ruby 2.x.x, adds debugger
      binding.pry
    end

    def add_a_bunch_of_contacts_so_i_dont_have_to_keep_typing_them_out

      first = ["Andy", "Jim", "Mary", "Amy", "George", "Lucas", "Chris", "Matt", "Sarah", "Julie"]
      last = ["Smith", "Martinez", "Parker", "Black", "Johnson", "King", "Nolin", "Verges", "Kerns"]
      domain = ["google", "bell", "example", "sympatico", "rogers", "hotmail"]
      email_suffix = [".com", ".net", ".org", ".tv"]
      notes = "Some notes go here."

      11.times do |count|
        first_name = first.sample
        last_name = last.sample
        email = first_name + "." + last_name + "@" + domain.sample + email_suffix.sample
        
        @rolodex.add_contact first_name, last_name, email.downcase, notes
      end
    end

    def columnize id, a, b, c, d
      left_padding = "  "
      left_padding + id.to_s.ljust(6) + a.ljust(10) + b.ljust(16) + c.ljust(32) + d
    end
end
