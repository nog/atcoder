N = gets.to_i
st = {}
ts = {}
N.times do
  s, t = gets.split
  st[s] = t
  ts[t] = s
end


l = true
while(l) do
  l = false
  keys = st.keys
  if keys.size == 0
    puts 'Yes'
    exit
  end
  keys.each do |s|
    t = st[s]
    next unless t
    next if st[t]
    st.delete(s)
    while(ts[s]) do
      s = ts[s]
      st.delete(s)
    end
      
    l = true
  end
end

puts 'No'