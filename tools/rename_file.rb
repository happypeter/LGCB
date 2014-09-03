#encoding: utf-8
str = IO.read("index.html")
s = str
pat = /\"(.*)\.html\"/

i = 0
a = []
str.gsub(pat) do |p|
 name = i < 10 ? ('0' + i.to_s + '_' + $1) : (i.to_s + '_' + $1)
 a << name
 new = name + '.md'
 old = $1 + '.md'
 system("mv #{old} #{new}")
 i = i + 1
end

a.each do |n|
  name = n[3..-1]
  str.gsub!(/#{name}/, "#{n}")
end

File.open("index.html", 'w') do |f|
  f.write(str)
end

