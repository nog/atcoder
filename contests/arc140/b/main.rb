N = gets.to_i
S = gets.chomp

s = S.dup
list = s.scan(/A+RC+/)

counts = list.map do |str|
  if str.size == 3
    next 1
  end
  ac = str.count('A')
  cc = str.count('C')
  next ac < cc ? ac : cc
end

hash = {}
counts.each do |c|
  hash[c] ||= 0
  hash[c] += 1
end

counts = hash.to_a.sort
# warn counts.inspect
result = 0
while(counts.size > 0) do
  # warn counts.inspect
  if counts.size == 1
    cnt = counts[0]
    if cnt[0] == 1
      result += cnt[1]
    else
      result += (cnt[1] * 2)
    end
    break
  else
    min, min_count = counts.shift
    max, max_count = counts.pop
    if min_count >= max_count
      result += 2 * max_count
      max -= 1
      min_count -= max_count
      if max == min
        min_count += max_count
      elsif counts[-1][0] == max
        counts[-1][1] += max_count
      else
        counts.push([max, max_count])
      end
      counts.unshift([min, min_count]) if min_count > 0
    else
      result += 2 * min_count
      max_count -= min_count
      if counts[-1] && counts[-1][0] == max - 1
        counts[-1][1] += min_count
      else
        counts.push([max -1, min_count])
      end
      counts.push([max, max_count])
    end
  end
end

puts result