x = gets.to_i

m = 100
r = 1
while true do
  m = (m * 1.01).to_i
  if m >= x
    puts r 
    exit
  end
  r += 1
end