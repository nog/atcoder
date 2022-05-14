N = gets.to_i
st = Array.new N
counts = {}
N.times do |i|
  s, t = gets.split
  counts[s] ||= 0
  counts[s] += 1
  counts[t] ||= 0
  counts[t] += 1
  st[i] = [s,t]
end

# warn st.inspect
# warn counts.inspect
st.each do |s,t|
  if s != t
    if ( counts[s] != 1 ) && ( counts[t] != 1 )
      puts 'No'
      exit
    end
  else
    if counts[s] != 2
      puts 'No'
      exit
    end
  end
end

puts 'Yes'