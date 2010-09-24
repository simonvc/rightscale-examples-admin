#!/usr/bin/ruby

#=======================================================================================================
# Function to insert markers braking up the output

def titleSection(sectionName)
  print "\n"
  80.times { print '=' }
  print "\n"
  puts sectionName
  sectionName.length.times { print '*' }
  print "\n"
end

#=======================================================================================================
# basic function definition
titleSection('Functions')
def sayGoodnight(name)
  result = "Goodnight, " + name
  return result
end

puts sayGoodnight("John-Boy")
puts sayGoodnight("Mary-Ellen")

#=======================================================================================================
# Code blocks
titleSection('Code Blocks')

def myBlock
  yield
  yield
end

myBlock { puts "This is the test block" }

def myBlock2
  yield "test"
  yield "test1"
end

myBlock2 { |a| puts a }

#=======================================================================================================
# Arrays and Hashes
titleSection('Arrays')

a = [ 1, 'cat', 3.14 ]
puts a
puts "a[0] = #{a[0]}"

a[2] = nil
puts a

empty1 = []
empty2 = Array.new

a = %w{ cat dog fish ferret rabbit chicken }
puts a[0]
puts a[2]

#=======================================================================================================
titleSection('Hashes')

instSection = {
  'cello' => 'string',
  'clarinet' => 'woodwind',
  'drum' => 'percussion',
  'oboe' => 'woodwind',
  'trumpet' => 'brass',
  'violin' => 'string'
}

puts instSection
puts instSection['oboe']
puts instSection['cello']
puts instSection['triangle']

histogram = Hash.new(0) # new hash with a default value of '0' not nil
puts histogram['key1']
puts histogram['key1'] = histogram['key1'] + 1

#=======================================================================================================
# Control Structures

titleSection('Control Structures')

count = 10

# basic 'if' structure
if count < 11
  puts 'Low enough'
end

# basic if else if else
if count > 10
  puts 'High enough'
elsif count == 10
  puts 'Count is spot on 10'
else
  puts 'Count is just too darned low'
end

# basic 'while'
while count > 0
  puts "count is now #{count}"
  count -= 1
end

# alternate format (perlish)
puts "this is a test" if count == 0 # 'if' structure
puts "count is now #{count = count + 1}" while count < 10

#=======================================================================================================
# Regular Expressions

titleSection('Regular Expressions')
print "enter text: "
line = gets.chomp
if line =~ /test.*/
  puts "The line contained \'test\' and was #{line.length} characters long"
end

line = line.sub(/test/, 'try')
puts "The line is now: \'#{line}\'"

line = line.gsub(/\s/, "_")
puts "The line is now: \'#{line}\'"

#======================================================================================================
# Iterators

titleSection('Iterators')

# Iterate over an array
a.each do | entry |
  puts "The entry was: #{entry}"
end

#Iterate over a hash
instSection.keys.each do |key|
  puts "The value associated with #{key} is: #{instSection[key]}"
end

# Progressive iterating
5.times { puts "testing" }
3.upto(6) { |i| puts "the value of \'i\' is: #{i}" }
('a' .. 'z').each { |letter| print "#{letter}, "}
puts

#======================================================================================================
# Readin' 'n' 'Ritin'

# similar to c and perl's 'printf'
printf "Number: %2.3f, String: %s\n", 5.3136, "my String"

# prints whatever is typed
print gets

#while gets
#  if /Ruby/
#    print
#  end
#end

ARGF.each { |line| print line if line =~ /Ruby/ }
