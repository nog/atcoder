N, X, Y = gets.split.map(&:to_i)

def calc(n, red, blue)
  if n == 1
    return blue
  else
    calc(n-1, (X+1) * red + blue, Y * (blue + X * red))
  end
end

puts calc(N, 1, 0)