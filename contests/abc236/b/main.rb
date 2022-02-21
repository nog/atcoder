N = gets.to_i
A = gets.split.map(&:to_i)

hash = {}
A.each do |a|
  hash[a] ||= 0
  hash[a] += 1
end

1.upto(N) do |i|
  if hash[i] == 3
    puts i
    exit
  end
end