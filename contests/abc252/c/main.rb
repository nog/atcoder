N = gets.to_i
S = Array.new N
N.times do |i|
  S[i] = gets.split('').map(&:to_i)
end

result = 10**9

10.times do |target|
  done = {}
  S.each do |s|
    10.times do |i|
      if s[i] == target
        x = 0
        while done[i+(x*10)] do
          x += 1
        end
        done[i+(x*10)] = true
      end
    end
  end
  res = done.keys.max
  result = res if res < result
end
puts result