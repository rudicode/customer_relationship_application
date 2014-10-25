class Contact

  attr_reader   :first_name, :last_name, :email, :notes
  attr_accessor :id

  def initialize first_name, last_name, email, notes
	  @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def full_name
    @first_name + " " + @last_name
  end
end
