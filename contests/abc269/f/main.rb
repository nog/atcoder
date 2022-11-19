N, M = gets.split.map(&:to_i)
Q = gets.to_i

MOD = 998244353

Q.times do
  a, b, c, d= gets.split.map(&:to_i)
  result = 0
  # odd
  oa = a.odd? ? a : a+1
  ob = b.odd? ? b : b-1
  if oa <= ob
    oc = c.odd? ? c : c + 1
    od = d.odd? ? d : d - 1
    if oc <= od
      first = (oa - 1) * M + oc 
      last  = (oa - 1) * M + od 
      linen = ((od - oc) / 2) + 1 
      line = linen * (first + last) / 2
      di = linen * M * 2 
      taten = (ob - oa) / 2 + 1 
      n1d = (taten - 1 ) * di
      res = taten * ( line * 2 + n1d ) / 2
      # warn "odd:#{res}
      result = result +  res
    end
  end

  ea = a.even? ? a : a+1
  eb = b.even? ? b : b-1
  if ea <= eb
    ec = c.even? ? c : c + 1
    ed = d.even? ? d : d - 1
    # warn "ea:#{ea} eb:#{eb} ec:#{ec} ed:#{ed}"
    if ec <= ed
      first = (ea - 1) * M + ec 
      last  = (ea - 1) * M + ed 
      linen = ((ed - ec) / 2) + 1 
      line = linen * (first + last) / 2 
      di = linen * M * 2 
      taten = (eb - ea) / 2 + 1 
      n1d = (taten - 1 ) * di 
      res = taten * ( line * 2 + n1d ) / 2
      # warn "even:#{res}"
      result = result +  res
    end
  end
  # warn "res:#{result}"
  puts result % MOD
end