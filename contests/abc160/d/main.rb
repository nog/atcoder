n, x, y = gets.split.map(&:to_i)

dcounts = {}
1.upto(n-1) do |a|
  (a + 1).upto(n) do |b|
    d1 = b - a
    d2 = (x - a).abs + (y - b).abs + 1
    if d1 < d2
      dcounts[d1] ||= 0
      dcounts[d1]+= 1
    else
      dcounts[d2] ||= 0
      dcounts[d2]+= 1
    end
  end
end

1.upto(n-1) do |i|
  puts dcounts[i] || 0
end