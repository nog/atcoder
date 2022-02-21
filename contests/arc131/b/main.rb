H, W = gets.split.map(&:to_i)
C = Array.new H+2
H.times do |i|
  C[i+1] = [-1, *gets.chomp.split('').map{|x| x == '.' ? 0 : x.to_i }, -1]
end
C[0] = [-1] * (W+2)
C[-1] = [-1] * (W+2)
kouho = [1,2,3,4,5]
1.upto(H) do |h|
  prev_line = C[h-1]
  line = C[h]
  next_line = C[h+1]
  1.upto(W) do |w|
    cur = line[w]
    next if cur > 0
    mawari = {}
    [prev_line[w], next_line[w], line[w-1], line[w+1]].each do |m|
      mawari[m] = true if m > 0
    end
    kouho.each do |k|
      next if mawari[k]
      line[w] = k
      break
    end
  end
end

1.upto(H) do |h|
  line = C[h]
  puts line[1..-2].join('')
end