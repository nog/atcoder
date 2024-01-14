N, Q = gets.split.map(&:to_i)

stat = {}
Q.times do
  t, a, b = gets.split.map(&:to_i)
  if t == 1
    stat[a] ||= {}
    stat[a][b] = true
  elsif t == 2
    if stat[a]
      stat[a].delete(b)
    end
  elsif t == 3
    if stat[a] && stat[a][b] && stat[b] && stat[b][a]
      puts 'Yes'
    else
      puts 'No'
    end
  else
    raise
  end

end