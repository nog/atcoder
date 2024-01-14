N, K = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)

pindex = {}
P.each.with_index do |x,i|
  pindex[x] = i
end

klist = []
list = (1..N).to_a
resolved = 0

while(P[resolved] == list[resolved]) do
  resolved += 1
end

while(resolved < N) do
  # warn "--"
  x = P[resolved]
  xi = list.find_index(x)
  k = N - xi
  lista = list[0...-k]
  listb = list[-k..-1]
  # warn "lista:#{lista.inspect}"
  # warn "listb:#{listb.inspect}"
  while(P[resolved] == listb[0]) do
    lista.insert(resolved, listb.shift)
    resolved += 1
  end
  i = resolved
  listb.each do |b|
    # warn "i:#{i}"
    while(lista[i] && (pindex[b] > pindex[lista[i]])) do
      i+=1
      # warn "i:#{i}"
    end
    lista.insert(i, b)
    i+=1
  end
  klist.push(k)
  if klist.size > K
    puts -1
    exit
  end

  list = lista
  while(resolved < N && P[resolved] == list[resolved]) do
    resolved += 1
  end
  # warn list.inspect
end
result = 99999999999999999999
C.combination(klist.size).each do |a|
  r = 0
  klist.size.times do |i|
    r += klist[i] * a[i]
  end
  result = r if r <result
end

puts result