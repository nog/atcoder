N = gets.to_i

x = N % 6

n = x + 6

r = Array.new(12)

r6s = <<END
##..#.
##..#.
..##.#
..##.#
##...#
..###.
END

r[6] = r6s.split("\n").map{|x| x.split('')}

r7s = <<END
##..#..
##..#..
..#..##
..##.#.
##...#.
...##.#
..##..#
END
r[7] = r7s.split("\n").map{|x| x.split('')}

r8s = <<END
##..#...
##..#...
..#..##.
..##.#..
##...#..
...##..#
...#..##
..#...##
END
r[8] = r8s.split("\n").map{|x| x.split('')}

r9s = <<END
##..#....
##..#....
..#..##..
..##.#...
##......#
...#...##
......###
..#...##.
...###...
END
r[9] = r9s.split("\n").map{|x| x.split('')}

r10s = <<END
##..#.....
##..#.....
.....##..#
..##.#....
##......#.
.......###
......###.
..#...##..
...###....
..##.....#
END
r[10] = r10s.split("\n").map{|x| x.split('')}

r11s = <<END
##..#......
##..#......
.....##..#.
..##.#.....
##......#..
.......###.
......##..#
......##..#
...###.....
..##......#
..#.....##.
END
r[11] = r11s.split("\n").map{|x| x.split('')}

result = Array.new(N){ Array.new(N, ".")}

x = (N / 6) - 1
r6 = r[6]
x.times do |i|
  6.times do |j|
    line = result[i*6+j]
    r6l = r6[j]
    6.times do |k|
      line[i*6+k] = r6l[k]
    end
  end
end

n.times do |i|
  line = result[(6 * x) + i]
  rl = r[n][i]
  n.times do |j|
    line[(6*x)+j] = rl[j]
  end
end

result.each do |l|
  puts l.join('')
end