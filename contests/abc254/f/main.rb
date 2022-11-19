N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

Q.times do |i|
  h1, h2, w1, w2 = gets.split.map(&:to_i)
  cur = A[h1-1] + B[w1-1]
  if h1 != h2
    fir = A[h1-1]
    (h1-1).upto(h2-1) do |h|
      ah = A[h]
      cur = cur.gcd((ah-fir).abs) if ah != fir && ah != 1
      break if cur == 1
    end
  end
  if cur != 1
    if w1 != w2
      fir = B[w1-1]
      (w1-1).upto(w2-1) do |w|
        bw = B[w]
        cur = cur.gcd((bw-fir).abs) if bw != fir && bw != 1
        break if cur == 1
      end
    end
  end
  puts cur
end