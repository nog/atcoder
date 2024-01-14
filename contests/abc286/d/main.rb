N, X = gets.split.map(&:to_i)

xhash = {
  X => true
}
N.times do
  a, b = gets.split.map(&:to_i)
  coins = []
  1.upto(b) do |i|
    coins.push(a*i)
  end
  # warn coins.inspect
  xhash.keys.each do |x|
    coins.each do |c|
      break if c > x
      nx = x - c
      xhash[nx] ||= true
    end
  end
end

# warn xhash.inspect

puts xhash[0] ? 'Yes' : 'No'