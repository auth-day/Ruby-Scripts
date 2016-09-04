compare = []
path = ARGV[1] # Начальная директория
Dir.entries(path).each do |x|
  compare << File.mtime(path + x) if x.include? ARGV[0]
end
compare.sort!
compare.reverse!

unless compare.size < 5
Dir.entries(path).each do |x|
  if (File.mtime(path + x) < compare[4]) && (x.include? ARGV[0])
    p "DELETE"
  elsif x.include? ARGV[0]
    p "#{x}"
  end
end
end
