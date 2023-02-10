scores = [83, 71, 92, 64, 98, 87, 75, 69]

puts "High scores:"
high_scores = scores.select { |score| score > 80 }
puts high_scores

puts "Low scores:"
low_scores = scores.reject { |score| score > 80 }
puts low_scores

puts "Any score less than 70?"
any_low_score = scores.any? { |score| score < 70 }
puts any_low_score

puts "Score less than 70?"
score_less_than_70 = scores.detect { |score| score < 70 }
puts score_less_than_70