N = gets.to_i

result = 0
list = []
1.upto(17) do |i|
  x = [1] * i
  while(x.map(&:to_s).join('').to_i <= N) do
    list.push(x.dup)
    x.push(0)
  end
  
end
list.each do |x|
  cnt = x.count(0)
  diff = nil
  if cnt == 0
    diff = x.size
  elsif cnt == 1
    y = x.map(&:to_s).join('').to_i
    ny = N - y
    if ny >= 9
      diff = (x.size - 1) * 9
    elsif ny <= 1
      diff = x.size - 1
    else
      diff = (x.size - 1) * ny
    end
  else
    y = x.map(&:to_s).join('').to_i
    ny = N - y
    if ny >= 10**cnt
      diff = (x.size - cnt) * 9 * ( 10 ** (cnt-1) )
    else
      cnt1 = x.size - cnt
      xx = 10**(cnt-1)
      diff = 0
      0.upto(9) do |i|
        next if i == 1
        if xx * (i + 1) <= ny
          diff += cnt1 * 10 ** (cnt -1)
        elsif xx * i > ny
          break
        else
           # warn "N:#{N}"
           # warn "y:#{y}"
           # warn "i:#{i}"
           # warn "cnt:#{cnt}"
          size = N - y - i * (10 ** (cnt -1)) + 1
           # warn "size:#{size}"
          diff += cnt1 * size
          break
        end
      end
    end
  end
  # warn "---"
  # warn x.map(&:to_s).join('')
  # warn diff
  # warn "---"
  result += diff
end

puts result