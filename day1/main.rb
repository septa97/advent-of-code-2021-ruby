lines = File.readlines('day1/input.txt')
numbers = lines.map(&:to_i)
part1_incremental = numbers.each_cons(2).select {|window| window[1] > window[0] }
part2_incremental = numbers.each_cons(3).each_cons(2).select {|window| window[1].sum > window[0].sum }

puts "part 1: #{part1_incremental.length}"
puts "part 2: #{part2_incremental.length}"