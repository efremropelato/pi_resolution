require 'securerandom'
require 'time'

points_number = 1_000_000

inside_circle = 0
outside_circle = 0
start = Time.now

points_number.times do |i|
  x = SecureRandom.random_number
  y = SecureRandom.random_number

  if x * x + y * y < 1
    inside_circle += 1
  else
    outside_circle += 1
  end
  # system("clear") # Clear console
  # puts "Countdown #{points_number - i}"
end

# system("clear") # Clear console
finish = Time.now
puts "RB = #{(finish - start).to_f} seconds for => inside_circle: #{inside_circle} , outside_circle: #{outside_circle}"

pi = 4.0 * inside_circle.to_f / points_number.to_f
puts "RB = PI value with #{points_number} => #{pi}"
puts "-------------------------------------------------"

