
class Person
  attr_reader :first_name,
              :last_name,
              :email,
              :state

  def initialize(person_data)
    @first_name = person_data[:first_name]
    @last_name = person_data[:last_name]
    @email = person_data[:email]
    @state = person_data[:state].upcase
  end
end
