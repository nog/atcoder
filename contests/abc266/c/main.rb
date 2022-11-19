A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
D = gets.split.map(&:to_i)

P = [A, B, C, D]
# warn P.inspect

def area *plist
  # warn plist.inspect
  x = 0
  3.times  do |i|
    # warn "!!!"
    # warn plist[i%3].inspect
    # warn plist[(i+1)%3].inspect
    # warn plist[(i-1)%3].inspect
    x += plist[i%3][0] * (plist[(i+1)%3][1] - plist[(i-1)%3][1])
  end
  x /= 2
  x
end
4.times do |i|
  (i+1).upto(4) do |j|
    # warn "i:#{i} j:#{j}"
    if area(P[(i-1)%4], P[i%4], P[j%4]) < 0
      puts 'No'
      exit
    end

    if area(P[i%4], P[(i+1)%4], P[j%4]) < 0
      puts 'No'
      exit
    end

  end
end

puts 'Yes'