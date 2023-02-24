class Order

  TAX_TABLE = { "CO" => 0.02, "MT" => 0.0, "AZ" => 0.04 }

  attr_reader :email, :total, :state, :status

  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
  end

  def tax
    total * TAX_TABLE[state]
  end

  def to_s
    "#{email} (#{state}): $#{total} - #{status}"
  end
end

orders = []
orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)

puts orders

puts "Big orders:"
big_order = orders.select { |o| o.total >= 300 }
puts big_order

puts "Small orders:"
small_order = orders.reject { |o| o.total >= 300 }
puts small_order

puts "Has any pending orders?"
has_pending = orders.any? { |o| o.status == :pending }
puts has_pending

puts "Detect pending order:"
pending_order = orders.detect { |o| o.status == :pending }

puts "Pending orders:"
pending_orders = orders.select { |o| o.status == :pending }
puts pending_orders

puts "Completed orders:"
completed_orders = orders.select { |o| o.status == :completed }
puts completed_orders

pending_orders, completed_orders = orders.partition { |o| o.status == :pending }
puts "Pending orders:"
puts pending_orders
puts "Completed orders:"
puts completed_orders

big_orders, small_orders = orders.partition { |o| o.total >= 300 }
puts "Big orders:"
puts big_orders
puts "Small orders:"
puts small_orders

puts "Newsletter emails:"
# emails = []
# orders.each { |o| emails << o.email.downcase }
emails = orders.map { |o| o.email.downcase }
p emails

puts "Taxes:"
co_taxes = orders.select { |o| o.state == "CO" }.map { |o| o.tax }
p co_taxes

sum = orders.reduce(0) { |sum, o| sum + o.total }
puts "Total orders: $#{sum}"

# total_tax = orders.reduce(0) { |sum, o| sum + o.tax }
total_tax = orders.map { |o| o.tax }.reduce(:+)
puts "Total tax: $#{total_tax}"