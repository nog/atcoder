H, W = gets.split.map(&:to_i)
G = Array.new H
H.times do |i|
  G[i] = gets.split('')
end

dones = {}

@ch = 0
@cw = 0

def output
  puts "#{@ch + 1} #{@cw + 1}"
  exit
end

while(true) do
  if dones[@ch] && dones[@ch][@cw]
    puts -1
    exit
  end
  dones[@ch] ||= {}
  dones[@ch][@cw] = true

  s = G[@ch][@cw]
  if s == 'U'
    output if @ch == 0
    @ch -= 1
  elsif s == 'D'
    output if @ch == H - 1
    @ch += 1
  elsif s == 'L'
    output if @cw == 0
    @cw -= 1
  elsif s == 'R'
    output if @cw == W - 1
    @cw += 1
  else
    raise
  end
end