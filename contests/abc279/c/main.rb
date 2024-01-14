H, W = gets.split.map(&:to_i)
S = []
T = []
H.times do
  S.push(gets.split(''))
end
H.times do
  T.push(gets.split(''))
end

s = S.transpose
t = T.transpose

counts = {}
s.each do |l|
  str = l.join('')
  counts[str] ||= 0
  counts[str] += 1
end

def output res
  puts res ? 'Yes' : 'No'
  exit
end

t.each do |l|
  str = l.join('')
  unless counts[str]
    output false
  end
  counts[str] -= 1
  if counts[str] == 0
    counts.delete(str)
  end
end

output true