N = gets.to_i
list = []
phash = {}
N.times do |i|
  m = gets.to_i
  x = []
  m.times do
    _p, e = gets.split.map(&:to_i)
    x.push([_p, e])
    phash[_p] ||= {}
    phash[_p][e] ||= []
    phash[_p][e].push(i)
  end
  list.push(x)
end

henka = {}

phash.each do |k, v|
  emax = v.keys.max
  if phash[k][emax].size > 1
  else
    henka[phash[k][emax][0]] = true
  end
end

if henka.keys.size == N
  puts N
else
  puts henka.keys.size + 1
end