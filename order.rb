class Order
  attr_reader :email, :total

  def initialize(email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{email}: #{total}"
  end
end

orders = []
1.upto(5) do |n|
  orders << Order.new("customer#{n}@example.com", n * 10)
end
# puts orders

puts "Newsletter emails:"
orders.each { |o| puts o.email }

sum = 0
orders.each { |o| sum += o.total }
puts "Total sales: $#{sum}"

taxes = { "CO" => 0.02, "MT" => 0.0, "AZ" => 0.04 }
taxes.each do |key, value|
  puts "Key: #{key}, value: #{value * 100}%"
end