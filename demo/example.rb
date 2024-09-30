def say_goodnight(name)
  "Good night, #{name.capitalize}"
end

puts say_goodnight("Mary-Ellen") # => "Goodnight, Mary-Ellen"
puts say_goodnight("John-Boy") # => "Goodnight, John-Boy"# frozen_string_literal: true

a = [1, "cat", 3.14]
puts a[0]

inst_section = {
  cello: "string",
  clarinet: "woodwind",
  drum: "percussion"
}

puts inst_section[:cello]

animals = %w[ ant bee cat dog elk ]
animals.each { |animal| puts animal }

3.times { puts "Hip-Hip-Hooray" }

def wrap(&b)
  print "Santa says: "
  3.times(&b)
  print "\n"
end

wrap { print "Ho! " }

class Greeter
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

g = Greeter.new "Vitaliy"
puts g.name

module StoreHelper
  def capitalize_words(string)
    string.split(" ").map { |word| word.capitalize }.join(" ")
  end
end

include StoreHelper

print StoreHelper.capitalize_words("hello world")
