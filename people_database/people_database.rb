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
end 