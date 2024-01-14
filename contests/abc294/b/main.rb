H, W = gets.split.map(&:to_i)
AORD = 65

H.times do
  s = gets.split.map(&:to_i)
  puts s.map{|s| s == 0 ? '.' : (AORD + s - 1).chr}.join('')
end