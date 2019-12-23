#! /usr/bin/env ruby

contest = ARGV[0]
task    = ARGV[1]
lang    = ARGV[2]
command = ARGV[3]

contest_dir = "#{__dir__}/contests/#{contest}"
task_dir = "#{contest_dir}/#{task}"
task_url = "https://atcoder.jp/contests/#{contest}/tasks/#{contest}_#{task}"

script_file = case lang
when "ruby"
  "#{task_dir}/main.rb"
when "go"
  "#{task_dir}/main.go"
else
  raise
end

case command
when "setup"
  `mkdir -p #{task_dir}`
  `touch #{script_file}`
  `cd #{task_dir};oj download #{task_url}`
when "test"
  test_command = case lang
  when  "ruby"
    "ruby #{script_file}"
  when "go"
    "go run #{script_file}"
  else
    raise
  end
  
  `cd #{task_dir};oj test -c "#{test_command}"`
when "submit"
  `cd #{task_dir};oj submit #{task_url} #{script_file} -y`
else
  raise
end