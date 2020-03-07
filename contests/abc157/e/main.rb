N = gets.to_i
S = gets.chomp.split('')
Q = gets.to_i

Q.times do
  query = gets.split
  if query[0] == "1"
    i,c = query[1].to_i, query[2]
    S[i-1] = c
  elsif query[0] == "2"
    l, r = query[1].to_i - 1, query[2].to_i - 1
    puts S[l..r].uniq.size
  else
    raise
  end
end