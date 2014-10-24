class CRM

  def self.run name
    crm = CRM.new name
    crm.main_menu
  end

  def initialize name
    @name = name
  end

  def main_menu
    while true
      display_menu
      input = get_input
      process_option input
      break if input == 7
    end
  end

  def display_menu
    menu = <<CRMMENU

    [1] Add Contact
    [2] Modify Contact
    [3] Display All
    [4] Display Contact
    [5] Display Attribute
    [6] Delete Contact
    [7] Exit

CRMMENU
    puts menu
    print "Choose an option: "
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
      puts "#{option} is not a valid option."
    end
  end

  def add_contact
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end

  def modify_contact
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end

  def display_all_contacts
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end

  def display_contact
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end

  def display_attribute
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end

  def delete_contact
    puts "#{self.class}##{__method__} Not implamented yet!!"
  end
end
