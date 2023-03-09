def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected_result)
  puts "Running test..."
  result = yield
  if result == expected_result
    puts "Test passed!"
  else
    puts "Test failed!"
    puts "Expected #{expected_result}, but got #{result}"
  end
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }