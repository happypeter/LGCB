#encoding: utf-8
require 'kramdown'
require 'erb'

@tex = ""

Dir.glob("../../book/*.md").sort.each do |x|
  str = IO.read(x).lstrip
  reg = /^---\nlayout:.*\ntitle:(\p{Any}+)\n---\n/

  title = reg.match(str).to_s.gsub!(reg, '\1').strip
  text = str.gsub!(reg, '')

  doc = Kramdown::Document.new(
    text,
    :input => 'GFM',
    :hard_wrap => false,
    :auto_ids => true,
    :header_offset => -3
  ).to_latex

  @tex += "\\chapter{#{title}}\n\n" + doc
end

renderer = ERB.new(File.read("lgcb.tex.erb"))

File.open("lgcb.tex", "w+") do |f|
  f.write(renderer.result())
end

system("xelatex lgcb.tex")

# produce the contents of this book
system("xelatex lgcb.tex")

# remove useless files
system("./clean")

