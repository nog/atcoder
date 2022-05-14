N = gets.to_i
S = Array.new N
N.times do |i|
  S[i] = gets.chomp.split('').map{|x| x == '#' ? true : false }
end

def success
  puts 'Yes'
  exit
end
# 縦横
2.times do
  N.times do |i|
    line = S[i]
    next if line.count(true) < 4
    (N-5).times do |i|
      success if S[i..(i+5)].count(false) <= 2
    end
  end
  S = S.transpose
end

# ななめ
(N-5).times do |h|
  h2 = h+5
  (N-5).times do |w|
    cnt = 0
    6.times do |i|
      cnt += 1 unless S[h+i][w+i]
      break if cnt > 2
    end
    success if cnt <= 2
    cnt = 0
    6.times do |i|
      cnt += 1 unless S[h2-i][w+i]
      break if cnt > 2
    end
    success if cnt <= 2
  end
end

puts 'No'