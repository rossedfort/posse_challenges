require_relative 'person'

class PeopleDatabase
  attr_accessor :people

  def initialize(people = [])
    @people = people
  end

  def add(person_data)
    if person_data.class == Hash
      make_new_person(person_data)
    else
      person_data.each do |peep|
        make_new_person(peep)
      end
    end
  end

  def make_new_person(person)
    people << Person.new(person)
  end

  def remove(email)
    people.delete_if { |person| person.email == email }
  end

  def by_state(state)
    people.select { |person| person.state == state.upcase }
  end

  def all_emails
    people.map { |person| person.email }.join(", ")
  end

  def state_count(state)
    by_state(state.upcase).count
  end
end
