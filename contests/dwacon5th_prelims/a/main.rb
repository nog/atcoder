N = gets.to_i
A = gets.split(' ').map(&:to_i)

average = A.inject(0){|s, a| s + a }.to_f / N
diff_list = A.map{|a| { value: a, diff: (a-average).abs}}.sort_by{|a| a[:diff] }
warn diff_list
targets = diff_list.find_all{|a| a[:diff] == diff_list[0][:diff ]}.map{|a| a[:value]}
warn targets
puts A.find_index{|a| targets.include?(a)}