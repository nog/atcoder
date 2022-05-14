N = gets.to_i
A = gets.split.map(&:to_i)

hash = {}
A.each do |a|
  hash[a] = true
end

0.upto(2001) do |i|
  unless hash[i]
    puts i
    exit
  end
end