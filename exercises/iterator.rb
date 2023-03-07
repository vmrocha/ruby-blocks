def three_times
  1.upto(3) { |n| yield(n) }
end

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end