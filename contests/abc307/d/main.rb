N = gets.to_i
S = gets.chomp
res = []
nest = []
cur = res


N.times do |i|
  s = S[i]
  if s == '('
    ncur = ['(']
    cur.push(ncur)
    nest.push(cur)
    cur = ncur
  elsif s == ')'
    if nest.size == 0
      cur.push(s)
    else
      cur = nest.pop
      cur.pop
    end
  else
    cur.push(s)
  end
end

puts res.flatten.join('')