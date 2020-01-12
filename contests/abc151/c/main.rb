N, M = gets.split.map(&:to_i)
P, S = Array.new(M), Array.new(M)
M.times do |i|
  tmp, S[i] = gets.split
  P[i] = tmp.to_i
end

ac = {}
result = [0,0]
wa_count = {}
M.times do |i|
  pro = P[i]
  next if ac[pro]
  if S[i] == "AC"
    ac[pro] = true
    result[0] += 1
    result[1] += wa_count[pro] || 0
  else
    wa_count[pro] ||= 0
    wa_count[pro] += 1
  end
end

puts result.join(' ')