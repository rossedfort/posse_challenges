require_relative 'person'

class PeopleDatabase
  attr_accessor :people

  def initialize(people = [])
    @people = people
  end

  def add(person_data)
    person = Person.new(person_data)
    people << person
  end

  def remove(email)
    people.delete_if { |person| person.email == email }
  end

  def by_state(state)
    people.select { |person| person.state == state }
  end
end
