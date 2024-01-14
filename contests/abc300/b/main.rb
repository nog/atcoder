H, W = gets.split.map(&:to_i)
A = []
H.times do
  A.push(gets.chomp.split(''))
end
B = []
H.times do
  B.push(gets.chomp.split(''))
end

H.times do |h|
  W.times do |w|
    res = true
    H.times do |hh|
      W.times do |ww|
        if A[ (h+hh)%H ][ (w+ww)%W ] != B[hh][ww]
          res = false
          break
        end
      end
      break unless res
    end
    if res
      puts 'Yes'
      exit
    end
  end
end

puts 'No'