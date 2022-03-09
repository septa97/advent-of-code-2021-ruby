lines = File.readlines('day3/input.txt')
board = lines.map { |line| line.strip.chars }

def part1(board)
    board_transposed = board.transpose

    gamma_array = board_transposed.map do |line|
        count_map = line.tally # .tally is on Ruby 2.7+ only, I believe
        count_map['0'] > count_map['1'] ? '0' : '1'
    end

    epsilon_array = gamma_array.map { |c| c == '0' ? '1' : '0' }

    gamma = gamma_array.join.to_i(2)
    epsilon = epsilon_array.join.to_i(2)

    gamma * epsilon
end

def count_occurences(board_transposed)
    board_transposed.map do |line|
        count_map = line.tally # .tally is on Ruby 2.7+ only, I believe
        (count_map['0'] || 0) > (count_map['1'] || 0) ? '0' : '1'
    end
end

def same_count(board_transposed, idx, t)
    count = board_transposed.map do |line|
        count_map = line.tally # .tally is on Ruby 2.7+ only, I believe
        if t == 'most'
            if (count_map['0'] || 0) > (count_map['1'] || 0)
                '0'
            elsif (count_map['0'] || 0) < (count_map['1'] || 0)
                '1'
            else
                'equal'
            end
        else
            if (count_map['0'] || 0) < (count_map['1'] || 0)
                '0'
            elsif (count_map['0'] || 0) > (count_map['1'] || 0)
                '1'
            else
                'equal'
            end
        end
    end

    count[idx] == 'equal'
end

def part2(board)
    temp_board = board.clone
    idx = 0
    while !same_count(temp_board.transpose, idx, 'most')
        most_common_array = count_occurences(temp_board.transpose)

        temp_board = temp_board.select { |line| line[idx] == most_common_array[idx] }

        idx += 1
    end

    temp_board = temp_board.select { |line| line[idx] == '1'}

    # TODO: what if length is more than 1?
    oxygen = temp_board[0].join.to_i(2)

    temp_board = board.clone
    idx = 0
    while !same_count(temp_board.transpose, idx, 'least')
        most_common_array = count_occurences(temp_board.transpose)

        temp_board = temp_board.select { |line| line[idx] != most_common_array[idx] }

        idx += 1
    end

    temp_board = temp_board.select { |line| line[idx] == '0'}

    # TODO: what if length is more than 1?
    co2 = temp_board[0].join.to_i(2)

    oxygen * co2
end

puts "part 1: #{part1(board)}"
puts "part 2: #{part2(board)}"