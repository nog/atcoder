N, K = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)

stacks = []
results = Array.new(N)
max = 0

P.each.with_index do |card, turn|
  # warn stacks.inspect
  stack = nil
  si = nil
  if card < max
    i = stacks.bsearch_index do | c, st|
      card < c
    end
    num, stack = stacks[i]
    next if num < card
    stack.push(card)
    stacks[i] = [card, stack]
    si = i
  else
    # max = card
    stack = [card]
    stacks.push([card, stack])
  end
  if stack.size >= K
    stack.each do |c|
      results[c-1] = turn + 1
    end
    stacks.delete_at(si || -1)
  end
  if stacks.size == 0
    max = 0
  else
    max, _ = stacks[-1]
  end
end

results.each do |r|
  puts r ? r : -1
end