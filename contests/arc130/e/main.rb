N, K = gets.split.map(&:to_i)
I = gets.split.map(&:to_i)

result = Array.new N
cur = Array.new N
min = 1
mins = {}
cnts = {}
I.each do |i|
  warn cnts.inspect
  if !result[i-1]
    result[i-1] = min
    cur[i-1] = min + 1
    cnts[min+1] ||= {}
    cnts[min+1][i-1] = true
  else
    c = cur[i-1]
    if c == min
    elsif (cnts[min] || {}).keys.size > 0
      puts -1
      exit
    end
    cnts[c].delete(i-1)
    cnts[c+1] ||= {}
    cnts[c+1][i-1] = true 
    min = c
    cur[i-1] += 1
  end
end

puts result.map{|x| x || min }.join(' ')