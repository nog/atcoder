X = gets.chomp.split('')
N = gets.to_i
S = Array.new N
N.times do |i|
  S[i] = gets.chomp
end


char_map = {}
az = ('a'..'z').to_a
26.times do |i|
  char_map[X[i]] = az[i]
end

conv_s = Array.new N
s_map = {}
N.times do |i|
  s = S[i]
  cs = s.split('').map{|x| char_map[x] }.join('')
  conv_s[i] = cs
  s_map[cs] = s
end

conv_s.sort.each do |cs|
  puts s_map[cs]
end
