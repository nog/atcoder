N = gets.to_i
S = gets.chomp.split('')
indexes = {}
S.each.with_index do |s, i|
  indexes[s] ||= []
  indexes[s].push(i)
end

# warn indexes.inspect
s = S.dup

first = []
last = []
firstc = 0
lastc = N-1
("a".."z").each do |c|
  list = indexes[c]
  next unless list

  while(list[0]) do
    while(list[0] && list[0] < firstc) do
      list.shift
    end
    break if list.empty?
    while(list[-1] && list[-1] > lastc) do
      list.pop
    end
    break if list.empty?
    while(list[0] == firstc) do
      first.push(c)
      list.shift
      firstc += 1
    end
    break if list.empty?
    l = list.pop
    first.push(c)
    while(l < lastc) do
      last.push(S[lastc])
      lastc -= 1
    end
    last.push(S[firstc])
    firstc += 1
    lastc = l - 1
  end
end

puts first.join('') + last.reverse.join('')