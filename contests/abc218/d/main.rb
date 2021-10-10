N = gets.to_i

fieldx = {}
fieldy = {}
result = 0
N.times do |i|
  x, y = gets.split.map(&:to_i)

  fy = fieldy[y] || {}

  (fieldx[x] || {}).keys.each do |yy|
    (fieldy[yy] || {}).keys.each do |xx|
      next if x == xx
      if fy[xx]
        result += 1
      end
    end
  end

  fieldx[x] ||= {}
  fieldx[x][y] = true
  fieldy[y] ||= {}
  fieldy[y][x] = true
end

puts result