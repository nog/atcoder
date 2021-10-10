S, T = gets.split.map(&:to_i)
result = 0
0.upto(S) do |a|
  0.upto(S-a) do |b|
    0.upto(S-a-b) do |c|
      if a * b * c <= T 
        result += 1
      else
        break
      end
    end
  end
end

puts result