
class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

flyers = []
1.upto(5) do |n|
  flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
end
# puts flyers

total = 0
flyers.each do |f|
  puts "#{f.name} - #{f.miles_flown} miles"
  total += f.miles_flown
end
puts "Total miles flown: #{total}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each do |key, value|
  puts "Earn #{value}x miles by flying #{key}!"
end

flyers.each do |flyer|
  promotions.each do |company, multiplier|
    puts "#{flyer.name} could earn #{flyer.miles_flown * multiplier} miles by flying #{company}!"
  end
end