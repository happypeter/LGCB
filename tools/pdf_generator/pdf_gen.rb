#encoding: utf-8
require 'kramdown'
require 'erb'

@tex = ""
reg = /^---\nlayout:.*\ntitle:(\p{Any}+)\n---\n/
graphic_options = '[width=10cm,height=10cm,keepaspectratio]'

Dir.glob("../../book/*.md").sort.each do |f|
  str = IO.read(f).lstrip
  title = reg.match(str).to_s.gsub!(reg, '\1').strip
  text = str.gsub!(reg, '')

  doc = Kramdown::Document.new(
    text,
    :input => 'GFM',
    :hard_wrap => false
  ).to_latex

  @tex += "\\chapter{#{title}}\n\n" + doc
end

renderer = ERB.new(File.read("lgcb.tex.erb"))
tex = renderer.result()

# setup graphic
tex.gsub!(/\n(\\begin\{figure\})\n/, "\n\\1[htb]\n" ).gsub!(/\n(\\includegraphics)/, "\n\\1#{graphic_options}")

File.open("lgcb.tex", "w+") do |f|
  f.write(tex)
end

system("xelatex lgcb.tex")

# produce the contents of this book
system("xelatex lgcb.tex")

# remove useless files
system("./clean")

