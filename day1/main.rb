lines = File.readlines('day1/input.txt')
numbers = lines.map(&:to_i)
part1 = numbers.each_cons(2).count { |prev, curr| curr > prev }
part2 = numbers.each_cons(3).each_cons(2).count { |prev, curr| curr.sum > prev.sum }

puts "part 1: #{part1}"
puts "part 2: #{part2}"
