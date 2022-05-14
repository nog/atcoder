S = gets.chomp.split('')
LIST = S.map do |s|
  s == "A" ? 0 : (s == "B") ? 1 : 2
end
S0 = LIST[0]

CHR = ["A", "B", "C"]
Q = gets.to_i

def calc t, k
  if k == 0
    d = t % 3
    return (S0 + d) % 3
  elsif t == 0
    return LIST[k]
  else
    if k.odd?
      (calc(t-1,k/2) - 1) % 3
    else
      (calc(t-1,k/2) + 1) % 3
    end
  end
end
Q.times do
  t, k = gets.split.map(&:to_i)
  puts CHR[calc(t, k-1)]
end