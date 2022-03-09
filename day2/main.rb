lines = File.readlines('day2/input.txt')

def part1(lines)
  depth = 0
  horizontal = 0

  lines.each do |line|
    ins, arg = line.split
    arg = arg.to_i
    if ins == 'forward'
        horizontal += arg
    elsif ins == 'down'
        depth += arg
    else # we're sure that it's "up"
        depth -= arg
    end
  end

  horizontal * depth
end

def part2(lines)
  depth = 0
  horizontal = 0
  aim = 0

  lines.each do |line|
    ins, arg = line.split
    arg = arg.to_i
    if ins == 'down'
        aim += arg
    elsif ins == 'up'
        aim -= arg
    else # we're sure that it's "forward"
        horizontal += arg
        depth += aim * arg
    end
  end

  horizontal * depth
end

puts "part 1: #{part1(lines)}"
puts "part 2: #{part2(lines)}"