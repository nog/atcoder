N = gets.to_i
A = gets.split.map(&:to_i)

rmax = 0
rmin = 0

2.times do
  max = 0
  min = 0
  cur = 0
  A.each do |a|
    if a == 0
      cur += 1
      if cur > max
        max = cur
      end
      r = cur - min
      rmax = r if r > rmax
    else
      cur -= 1
      if cur < min
        min = cur
      end
      r = - (max - cur)
      rmin = r if r < rmin
    end
  end
  A.reverse!
end

# warn hash.inspect
# warn "rmax:#{rmax} rmin:#{rmin}"
puts rmax - rmin + 1