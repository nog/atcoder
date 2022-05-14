N, M, K, S, T, X = gets.split.map(&:to_i)
@routes = Array.new(N+1){ Array.new }
M.times do
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[v] ||= []
  @routes[u].push(v)
  @routes[v].push(u)
end
MOD = 998244353

bda = Array.new N+1, 0
bdb = Array.new N+1, 0
bda[S] = 1

K.times do |i|
  da = Array.new N+1,0
  db = Array.new N+1,0

  N.times do |poi|
    poi += 1
    bca = bda[poi] || 0
    bcb = bdb[poi] || 0
    next if bca == 0 && bcb == 0

    @routes[poi].each do |to|
      if to == X
        da[to] = ((da[to] || 0) + bcb) % MOD if bcb > 0
        db[to] = ((db[to] || 0) + bca) % MOD if bca > 0
      else
        da[to] = ((da[to] || 0) + bca) % MOD if bca > 0
        db[to] = ((db[to] || 0) + bcb) % MOD if bcb > 0
      end
    end
  end

  bda = da
  bdb = db
end

puts (bda[T] || 0) % MOD