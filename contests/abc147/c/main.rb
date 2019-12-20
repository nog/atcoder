N = gets.chomp.to_i

answers = {}
N.times do |i|
  answer_count = gets.to_i
  answer_count.times do
    x, y = gets.chomp.split(' ').map(&:to_i)
    answers[i] ||= {}
    answers[i][x-i] = (y == 1)
  end
end
result = 0
catch :ok do 
  [true, false].repeated_permutation(N) do |honests|
    catch :ng do
      N.times do |i|
        next unless honests[i]
        answers[i].each do |target, honest|
          throw :ng if honests[target] != honest
        end
      end
      result = honests.find_all.count
      throw :ok
    end
  end
end

puts result