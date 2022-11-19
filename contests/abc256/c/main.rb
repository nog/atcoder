h1, h2, h3, w1, w2, w3 = gets.split.map(&:to_i)

result = 0

1.upto(h1-2) do |m11|
  next if m11 > w1 - 2
  1.upto(h1-m11-1) do |m12|
    next if m12 > w2 - 2
    m13 = h1 - m11 - m12
    1.upto(w1 - m11 - 1) do |m21|
      next if m21 > h2 - 2
      m31 = w1 - m11 - m21
      next if m31 <= 0
      1.upto(h2 - m21 - 1) do |m22|
        next if m22 > w2 - m12 - 1
        m23 = h2 - m21 - m22
        m32 = w2 - m12 - m22
        next if m23 <= 0
        next if m32 <= 0

        m33 = h3 - m32 - m31
        next if m33 <= 0
        if m13 + m23 + m33 == w3
          next unless  m11 + m12 + m13 == h1
          next unless  m21 + m22 + m23 == h2
          next unless  m31 + m32 + m33 == h3
          next unless  m11 + m21 + m31 == w1
          next unless  m12 + m22 + m32 == w2
          next unless  m13 + m23 + m33 == w3
          result += 1
        end
      end
    end
  end
end

puts result