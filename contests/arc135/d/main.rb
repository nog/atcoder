H, W = gets.split.map(&:to_i)
A = Array.new H
H.times do |i|
  A[i] = gets.split.map(&:to_i)
end


changed = true
while(changed) do
  changed = false
  line1 = A[0]
  (H-1).times do |h|
    line2 = A[h+1]
    a, c = line1[0], line2[0]
    (W-1).times do |w|
      b, d = line1[w+1], line2[w+1]
      diff = nil
      pm = 0
      list = [a,b,c,d]
      list.each do |x|
        if x > 0
          pm += 1
        elsif x < 0
          pm -= 1
        end
      end
      if pm > 0
        list.each do |x|
          next if x <= 0
          diff ||= x
          diff = x if x < diff
        end
      elsif pm < 0
        list.each do |x|
          next if x >= 0
          diff ||= x
          diff = x if x > diff
        end
      end

      diff ||= 0
      if diff != 0
        a = line1[w] = a - diff
        b = line1[w+1] = b - diff
        c = line2[w] = c - diff
        d = line2[w+1] = d - diff
        changed = true
      end
      a, c = b, d
    end
    line1 = line2
  end
end

puts A.map{|line| line.sum }.sum
A.each do |line|
  puts line.join(' ')
end