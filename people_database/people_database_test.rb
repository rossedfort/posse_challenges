require_relative 'people_database'
require 'minitest/autorun'
require 'minitest/pride'

class PeopleDatabaseTest < Minitest::Test

  def person_one
    {first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO"}
  end

  def person_two
    {first_name: "Ezra", last_name: "Griffin", email: "ezra@turing.io", state: "CO"}
  end

  def person_three
    {first_name: "Steve", last_name: "Grifn", email: "steve@turing.io", state: "OH"}
  end

  def test_a_person_has_all_its_attributes
    person = Person.new(person_one)

    assert person.instance_of?(Person)
    assert_equal "Tess", person.first_name
    assert_equal "Griffin", person.last_name
    assert_equal "tess@turing.io", person.email
    assert_equal "CO", person.state
  end

  def test_people_array_is_an_empty_array
    people = PeopleDatabase.new

    assert_equal [], people.people
  end

  def test_people_can_be_added_to_the_people_database
    people = PeopleDatabase.new

    people.add(person_one)

    assert_equal 1, people.people.count
  end

  def test_multiple_people_can_be_added_to_the_people_database
    people = PeopleDatabase.new

    people.add([person_one, person_two])
    assert_equal 2, people.people.count
  end

  def test_people_can_be_removed
    people = PeopleDatabase.new([Person.new(person_one), Person.new(person_two)])

    assert_equal 2, people.people.count

    people.remove("tess@turing.io")

    assert_equal 1, people.people.count
  end

  def test_people_from_a_given_state_can_be_returned
    people = PeopleDatabase.new([Person.new(person_one), Person.new(person_two), Person.new(person_three)])

    the_state_peoples = people.by_state("CO")

    assert_equal 2, the_state_peoples.count
    assert_equal Person, the_state_peoples.first.class
    assert_equal "CO", the_state_peoples.first.state
  end

  def test_all_emails_return_all_emails
    people = PeopleDatabase.new([Person.new(person_one), Person.new(person_two), Person.new(person_three)])

    expected = "tess@turing.io, ezra@turing.io, steve@turing.io"

    assert_equal expected, people.all_emails
  end

  def test_count_from_state
    people = PeopleDatabase.new([Person.new(person_one), Person.new(person_two), Person.new(person_three)])

    assert_equal 2, people.state_count("CO")
  end

end
