
class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end

  def in_environment(new_environment)
    previous_environment = @environment
    @environment = new_environment
    yield
  rescue => e
    puts "Error: #{e.message}"
  ensure
    @environment = previous_environment
    puts "Reset environment to #{@environment}"
  end
end

app = Application.new

app.in_environment(:production) do
  app.connect_to_database
  app.handle_request
  raise "Boom!"
  app.write_to_log
end

app.in_environment(:test) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end