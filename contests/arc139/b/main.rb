T = gets.to_i

# def calc n, a, b, x, y, z
#   results = []
#   results.push(n*x)
# end
T.times do |i|
  n, a, b, x, y, z = gets.split.map(&:to_i)
  if Rational(y, a) > Rational(z, b)
    y, a, z, b = z, b, y, a
  end

  y = [y, a * x].min
  z = [z, b * x].min

  result = Float::INFINITY
  if (n / a) > a
    a.times do |bc|
      nn = n - (b * bc)
      r = bc * z
      ac = nn / a
      r += ac * y
      nn = nn % a
      r += nn * x

      if r < result
        result = r
      end
    end
  else
    ((n / a) + 1).times do |ac|
      nn = n - ( a * ac )
      r = ac * y
      bc = nn / b
      r += bc * z
      nn = nn % b
      r += nn * x

      if r < result
        result = r
      end
    end
  end

  puts result
end