N = gets.to_i
S = gets.chomp.split('')

r_list = []
g_list = []
b_list = []
S.each_with_index do |s,i|
  if s == 'R'
    r_list.push(i)
  elsif s == 'G'
    g_list.push(i)
  elsif s == 'B'
    b_list.push(i)
  else
    raise
  end
end
result = r_list.size * g_list.size * b_list.size
1.upto(N/2) do |n|
  (N - (2 * n)).times do |i|
    if S[i] != S[i+n]
      if S[i+2*n] != S[i] && S[i+2*n] != S[i+n]
        result -= 1
      end
    end
  end
end
# 1r_list.each do |r|
# 1  g_list.each do |g|
# 1    b_list.each do |b|
# 1      rgb = [r,g,b].sort
# 1      next if rgb[1] - rgb[0] == rgb[2] - rgb[1]
# 1      result += 1
# 1    end
# 1  end
# 1end

puts result

