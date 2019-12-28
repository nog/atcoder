#! /usr/bin/env ruby

def main
  contest = ARGV[0]
  task    = ARGV[1]
  lang    = get_lang(ARGV[2])
  command = ARGV[3]

  contest_dir = "#{__dir__}/contests/#{contest}"
  task_dir = "#{contest_dir}/#{task}"
  task_url = get_task_url(contest, task)

  script_file = case lang
  when :ruby
    "#{task_dir}/main.rb"
  when :golang
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
    when  :ruby
      "ruby #{script_file}"
    when :golang
      "go run #{script_file}"
    else
      raise
    end

    `cd #{task_dir};oj test -c "#{test_command}"`
  when "submit"
    `cd #{task_dir};oj submit #{task_url} #{script_file} -y`
  when "git"
    `git add #{task_dir};git commit -m "[#{lang}]#{contest}-#{task}";git push`
  else
    raise
  end
end

def get_task_url contest, task
  return (
    ENV['TASK_URL'] ||
    "https://atcoder.jp/contests/#{contest}/tasks/#{contest}_#{task}"
  )
end

def get_lang(name)
  result = {
    ruby: :ruby,
    rb: :ruby,
    go: :golang,
    golang: :golang
  }[name.to_sym]
  raise unless result
  result
end

main()