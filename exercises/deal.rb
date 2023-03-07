def deal
  unless block_given?
    puts "No deal!"
    return
  end
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  random_face = faces.sample
  random_suit = suits.sample
  score = yield(random_face, random_suit)
  puts "You scored a #{score}!"
end

deal do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

deal