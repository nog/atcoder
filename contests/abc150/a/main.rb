ARG_K, ARG_X = gets.split.map(&:to_i)
puts 500 * ARG_K >= ARG_X ? "Yes" : "No"