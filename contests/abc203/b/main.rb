N, K = gets.split.map(&:to_i)

result = 0
1.upto(N) do |n|
    1.upto(K) do |k|
        result += "#{n}0#{k}".to_i
    end
end

puts result