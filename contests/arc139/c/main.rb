N, M = gets.split.map(&:to_i)

nmax, mmax = [N, M].sort
max = 3 * nmax + mmax
results = Array.new(max - 3)

done = {}
min = 0
4.upto(max) do |r|

end

counts = 0
mmax.downto(1) do |m|
  1.upto(nmax) do |n|
    r1 = m + (3 * n)
    r2 = (3 * m) + n
    # break if results[r1 -4]
    if done[r2]
      break
    else
      if results[r1-4]
        next
      else
        done[r2] = true
        results[r1 - 4] = [n, m]
        counts += 1
      end
    end
    break if counts == max -3
  end
  break if counts == max -3
end

results.compact!
puts results.size
if N < M
  results.each do |n, m|
    puts [n, m].join(' ')
  end
else
  results.each do |m, n|
    puts [n, m].join(' ')
  end
end