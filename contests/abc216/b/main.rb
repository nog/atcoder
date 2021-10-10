N = gets.to_i

hash = {}
result = false
N.times do
  s, t = gets.split
  name = "#{s}-#{t}"
  if hash[name]
    result = true
    break
  else
    hash[name] = true
  end
end

puts result ? 'Yes' : 'No'