#!/usr/bin/env ruby
require 'find'

if ARGV.size < 2
  puts "Usage) symlinks.rb TARGET_DIR SYMLINK_DIR"
  exit 1
end

TARGET_DIR = ARGV[0]
SYMLINK_DIR = ARGV[1]

Find.find(TARGET_DIR) do |target_path|
  begin
    next if target_path !~ /^#{TARGET_DIR.chomp("/")}\/(.*)/
  rescue ArgumentError => e
    STDERR.puts target_path
    next
  end
  symlink_path = File.join(SYMLINK_DIR, $1)
  results = `diff #{target_path} #{symlink_path}`
  if results.size == 0
    puts "ln -sf #{target_path} #{symlink_path}"
    %x(ln -sf #{target_path} #{symlink_path})
  end
end
