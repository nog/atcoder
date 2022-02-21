N, X = gets.split.map(&:to_i)
before = {
  X => 1
}
N.times do |i|
  l, *a = gets.split.map(&:to_i)
  cur = {
  }
  keys = before.keys
  a.each do |_a|
    keys.each do |k|
      if k % _a == 0
        r = k / _a
        cur[r] ||= 0
        cur[r] += before[k]
      end
    end
  end
  before = cur
end

puts before[1] || 0