T = gets.to_i
T.times do
  n, m = gets.split.map(&:to_i)
  c = gets.split.map(&:to_i)
  routes = {}
  m.times do
    u, v = gets.split.map(&:to_i)
    routes[u] ||= []
    routes[u].push(v)
    routes[v] ||= []
    routes[v].push(u)
  end

  if c[0] == c[n-1]
    puts -1
    next
  end

  done = Array.new(n+1){ Hash.new }
  done[1][n] = true

  queue = [[1, n, 0]]
  res = false
  while(a, b, cnt = queue.shift) do
    # warn "a:#{a} b:#{b} c:#{cnt}"
    aroutes = routes[a] || []
    broutes = routes[b] || []
    next if broutes.size == 0 || aroutes.size == 0

    nc = cnt + 1
    aroutes.each do |na|
      nac = c[na-1]
      donena = done[na]
      broutes.each do |nb|
        next if donena[nb]
        nbc = c[nb-1]
        next if nac == nbc
        if na == n && 1 == nb
          res = nc
          break
        end

        donena[nb] = true
        queue.push([na, nb, nc])
      end
      break if res
    end
    break if res
  end

  puts res || -1
end