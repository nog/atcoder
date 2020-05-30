t = gets.to_i
t.times do  |i|
  n, x2, x3, x5, p1 = gets.split.map(&:to_i)
  result = p1 * n + 1
  q = [[n,0]]
  check = {}
  while qq = q.shift do
    _n = qq[0]
    _r = qq[1]
    if result < _r 
      next
    end

    key = (Math.log10 _n)
    if check[key+1] && check[key+1] < _r
      next
    end
    check[key] ||= _r
    if check[key] > _r
      check[key] = _r
    end

    allp1 = _n * p1 + _r
    if allp1 < result
      result = allp1
    end
    if 5 <= _n
      mod = _n % 5
      res = _r + mod * p1 + x5
      if res < result
        q.push([_n/5, res])
      end
      if mod != 0
        res = _r + (5-mod) * p1 + x5
        if res < result
          q.push([(_n+5)/5, res])
        end
      end
    end
    if 3 <= _n
      mod = _n % 3
      res = _r + mod * p1 + x3
      if res < result
        q.push([_n/3, res])
      end
      if mod != 0
        res = _r + (3-mod) * p1 + x3
        if res < result 
          q.push([(_n+3)/3, res])
        end
      end
    end
    if 2 <= _n
      mod = _n % 2
      res = _r + mod * p1 + x2
      if res < result
        q.push([_n/2, res])
      end
      if mod != 0
        res = _r + (2-mod) * p1 + x2
        if res < result
          q.push([(_n+2)/2, res])
        end
      end
    end
  end

  puts result
  warn result
end