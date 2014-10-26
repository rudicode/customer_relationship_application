class Contact

	def self.attributes
  	["id", "first_name", "last_name", "email", "notes"]
  end

  attr_accessor   :id, :first_name, :last_name, :email, :notes

  def initialize first_name, last_name, email, notes
	  @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def full_name
    @first_name + " " + @last_name
  end

  def to_s
    "#{@first_name} #{@last_name} #{@email} [ #{@notes} ]"
  end

  def attributes
  	["id", "first_name", "last_name", "email", "notes"]
  end
end
