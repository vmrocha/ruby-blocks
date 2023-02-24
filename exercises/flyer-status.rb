
class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

frequent_flyers = flyers.select { |flyer| flyer.miles_flown >= 3000 }
puts frequent_flyers

infrequent_flyers = flyers.reject { |flyer| flyer.miles_flown >= 3000 }
puts infrequent_flyers

puts flyers.any? { |flyer| flyer.status == :platinum }

first_bronze_flyer = flyers.detect { |flyer| flyer.status == :bronze }
puts first_bronze_flyer

platinum_flyers, other_flyers = flyers.partition { |f| f.status == :platinum }
puts "Platinum flyers:"
puts platinum_flyers
puts "Other flyers:"
puts other_flyers

name_tags = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})"}
p name_tags

totals_in_kms = flyers.map { |flyer| flyer.miles_flown * 1.6 }
p totals_in_kms

total_miles_flown = flyers.reduce(0) { |sum, flyer| sum + flyer.miles_flown }
p total_miles_flown

p flyers.map { |flyer| flyer.miles_flown * 1.6 }.sum

bronze_total = flyers.select { |flyer| flyer.status == :bronze }.map { |flyer| flyer.miles_flown * 1.6}.sum
# bronze_total = flyers.select { |flyer| flyer.status == :bronze }.reduce(0) { |s, flyer| s + (flyer.miles_flown * 1.6)}
puts "Bronze total: #{bronze_total}"

top_flyer = flyers.max_by { |flyer| flyer.miles_flown }
puts "Top flyer: #{top_flyer}"