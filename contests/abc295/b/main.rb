R, C = gets.split.map(&:to_i)
B = []
R.times do
  B.push( gets.chomp.split('') )
end
9.downto(1) do |diff|
  R.times do |r|
    ro = B[r]
    C.times do |c|
      x = ro[c]
      next unless x.to_i == diff
      ndiff = diff - 1
      B[r][c] = '.'
      if r > 0
        B[r-1][c] = ndiff
      end
      if c > 0
        B[r][c-1] = ndiff
      end
      if r < R - 1
        B[r+1][c] = [ndiff, B[r+1][c].to_i].max
      end
      if c < C - 1
        B[r][c+1] = [ndiff, B[r][c+1].to_i].max
      end
    end
  end
end

B.each do |l|
  puts l.join('').gsub('0', '.')
end