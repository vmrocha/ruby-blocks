name = "Curly"
number = 100
temp = Math::PI / 4

3.times do |number; temp|
  name = "Moe"
  temp = 98.6
  puts "#{number} Howdy, #{name} is #{temp}!"
end

puts name
puts number
puts temp