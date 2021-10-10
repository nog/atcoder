T = gets.to_i
A = {
  0 => [[],[4,5]],
  1 => [[1],[4,5]],
  2 => [[1,2],[4,5]],
  3 => [[1,2,3],[5]],
  4 => [[2,3,4],[5]],
  5 => [[2,3,4,5],[5]],
  6 => [[2,3,4,5],[]],
  7 => [[3,4,5],[]],
  8 => [[3,4,5],[]],
  9 => [[3,4,5],[]]
}

B = {
  1 => [1,2,3],
  2 => [2,3,4,5,6],
  3 => [3,4,5,6,7,8,9],
  4 => [4,5,6,7,8,9,10,11],
  5 => [5,6,7,8,9,10,11,12,13,14,15]
}

T.times do
  ca = gets.to_i.to_s.split('').map(&:to_i).reverse

  pat = [1,2,3,4,5]
  kuripat = []
  ca.size.times do |i|
    c = ca[i]
    a = A[c]
    ka = A[c-1] || A[9]
    warn "c:#{c} a:#{a.inspect} ka:#{ka.inspect}"
    npat = ((pat & a[0]) + (kuripat & ka[0])).uniq
    nkuripat = ( pat & a[1] + (kuripat & ka[1])).uniq
    pat = npat
    kuripat = nkuripat
    warn "pat:#{pat.inspect} kuripat:#{kuripat.inspect}"
  end
  puts (pat + kuripat).sort[0]
  warn "-------"
end