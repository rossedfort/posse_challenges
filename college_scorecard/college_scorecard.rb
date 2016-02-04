require 'csv'
require 'pry'

class CollegeScorecard
  attr_reader :universities
  def initialize
    @universities = CollegeScorecard.read
  end

  def self.read
    rows = CSV.readlines('2013_college_scorecards.csv', headers: true, header_converters: :symbol).map do |row|
      row.to_h
    end
    rows.map do |row|
      {stabbr: row[:stabbr], instnm: row[:instnm], avgfacsal: row[:avgfacsal].to_i, grad_debt_mdn: row[:grad_debt_mdn]}
    end
  end

  def by_state(state, arg2 = nil)
    universities.select do |university|
      university[:stabbr] == state
    end.each {|university| puts university[:instnm]}
  end

  def top_average_faculty_salary(amount, arg2 = nil)
    top_amount = universities.sort_by do |univ|
      -univ[:avgfacsal]
    end.first(amount.to_i)
    top_amount.each {|state| puts state[:instnm]}
  end

  def median_debt_between(lower, upper)
    sanitized = universities.map do |univ|
      if sanitize(univ)
        {instnm: univ[:instnm], grad_debt_mdn: univ[:grad_debt_mdn].to_i}
      end
    end.compact
    calculate_median_debt_between(sanitized, lower, upper).each do |university|
      p "#{university[:instnm]} ($#{university[:grad_debt_mdn]})"
    end
  end

  def calculate_median_debt_between(sanitized, lower, upper)
    sanitized.select do |university|
      university[:grad_debt_mdn] < upper.to_i &&  university[:grad_debt_mdn] > lower.to_i
    end
  end

  def sanitize(univ)
    Float(univ[:grad_debt_mdn]) != nil rescue false
  end
end

CollegeScorecard.new.send(ARGV[0], ARGV[1], ARGV[2])
