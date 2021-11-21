S = gets.chomp
s = S.split('').map{|x|
  x == 'K' ? 1 : x == 'E' ? 2 : 3
}
K = gets.to_i

hash = {}
sk = s.join('').to_i
hash[sk] = K
queue = [[sk,K]]
len = S.length
result = 1

while(s, k = queue.shift) do
  s = s.to_s.split('').map(&:to_i)
  (len-1).times do |i|
    a = s[i]
    b = s[i+1]
    s[i] = b
    s[i+1] = a
    sk = s.join('').to_i
    unless hash[sk]
      hash[sk] = k
      result += 1
      queue.push([sk, k-1]) if k > 1
    end
    s[i] = a
    s[i+1] = b
  end
end

puts result