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

      [1] Add Contact
      [2] Modify Contact
      [3] Display All
      [4] Display Contact
      [5] Display Attribute
      [6] Delete Contact
      [7] Exit

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
    else
      @notice = "#{option} is not a valid option."
    end
  end

  def add_contact
    clear_screen
    puts "ADD CONTACT\n\n"

    print "First name: "
    first_name = gets.chomp().to_s

    print "Last name : "
    last_name = gets.chomp().to_s

    print "email     : "
    email = gets.chomp().to_s

    print "Notes     : "
    notes = gets.chomp().to_s

    # store new contact here
    @rolodex.add_contact first_name, last_name, email, notes

    wait_for_enter
    # no error checking yet, assume it was added.
    @notice = "#{first_name} #{last_name} added to contacts."

  end
 
  def self.stub(*names)
    names.each do |name|
      define_method(name) do
        @notice = "#{self.class}##{name} Not implemented yet!!"
      end
    end
  end

  stub :modify_contact, :display_all_contacts, :display_contact, :display_attribute, :delete_contact

  # def modify_contact
  #   @notice = "#{self.class}##{__method__} Not implemented yet!!"
  # end

  # def display_all_contacts
  #   @notice = "#{self.class}##{__method__} Not implemented yet!!"
  # end

  # def display_contact
  #   @notice = "#{self.class}##{__method__} Not implemented yet!!"
  # end

  # def display_attribute
  #   @notice = "#{self.class}##{__method__} Not implemented yet!!"
  # end

  # def delete_contact
  #   @notice = "#{self.class}##{__method__} Not implemented yet!!"
  # end

  private
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
end
