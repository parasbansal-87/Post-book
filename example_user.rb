class User
  attr_accessor :fname, :lname, :email

  def initialize(attributes = {})
    @fname  = attributes[:fname]
    @lname  = attributes[:lname]
    @email = attributes[:email]
  end

  def full_name
  	@name = @fname + ' ' + @lname
  	"#{@name}"
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end