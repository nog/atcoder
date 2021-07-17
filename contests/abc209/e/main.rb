N = gets.to_i
S = Array.new N
hash = {}
lasthash = {}
N.times do |i|
  s = gets.chomp
  first = s[0..2]
  last = s[-3..-1]
  S[i] = [s, first, last]
  if hash[first]
    hash[first].push(i)
  else
    hash[first] = [i]
  end
  if lasthash[last]
    lasthash[last].push(i)
  else
    lasthash[last] = [i]
  end
end
 
result = Array.new N
queue = []
N.times do |i|
  s, f, l = S[i]
  if hash[l]
    queue.push i
  else
    result[i] = true
  end
end
 
nq = []
queue.each do |i|
  s, f, l = S[i]
  exist = false
  hash[l].each do |ni|
    if result[ni] == true
      result[i] = false
      exist = true
      break
    end
  end
  unless exist
    nq.push(i)
  end
end
 
exist = true
while(exist) do
  exist = false
  queue = nq.uniq
  nq = []
  queue.each do |i|
    s, f, l = S[i]
    alllose = true
    win = false
    hash[l].each do |ni|
      if result[ni] == true
        win = true
        result[i] = false
        (lasthash[S[ni][2]] || []).each do |ll|
          nq.push(ll) if result[nq] == nil
        end
        exist = true
        break
      elsif result[ni] != false
        alllose = false
      end
    end
    if !win
      if alllose
        result[i] = true
        (lasthash[s] || []).each do |ni|
          result[ni] ||= false
          (lasthash[S[ni][2]] || []).each do |ll|
            nq.push(ll) if result[nq] == nil
          end
        end
        exist = true
      end
    end
  end
end
 
result.each do |re|
  if re == true
    puts 'Takahashi'
  elsif re == false
    puts 'Aoki'
  else
    puts 'Draw'
  end
end