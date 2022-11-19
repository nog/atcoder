N, M = gets.split.map(&:to_i)

arr = Hash.new
zan = N

rev = [1,0]
M.times do
  x, y = gets.split.map(&:to_i)
  arr[x] = y
  zan -= 1
  next if arr[x-1]
  if arr[x-2] == rev[y]
    arr[x-1] = false
    zan -= 1
  end
end

warn arr.inspect
warn "zan:#{zan}"