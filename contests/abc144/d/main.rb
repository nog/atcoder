a, b, x = gets.split.map(&:to_i)

if x >  a * a * b / 2.0
  rad = Math.atan(2*b/a.to_f - (2*x) / (a*a*a).to_f)
  puts rad.abs * 180 / Math::PI
  exit
else
  rad = Math.atan(((b*b*a).to_f/(2*x)))
  puts rad * 180 / Math::PI
  exit
end

