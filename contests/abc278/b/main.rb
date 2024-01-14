H, M = gets.split.map(&:to_i)

h, m = H, M

while(true) do
  a, b, c, d = h / 10, h % 10, m / 10, m % 10

  if 10 * a + c < 24 && 10 * b + d < 60
    puts "#{h} #{m}"
    exit
  end

  m += 1
  if m == 60
    m = 0
    h += 1
  end
  if h == 24
    h = 0
  end
end