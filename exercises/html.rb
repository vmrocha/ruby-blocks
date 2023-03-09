def h1
  puts "<h1>#{yield}</h1>"
end

def h2
  puts "<h2>#{yield}</h2>"
end

def tag(tag_name)
  print "<#{tag_name}>"
  print yield
  print "</#{tag_name}>"
end

h1 { "Breaking News!" }
h2 { "Massive Ruby Discovered" }

tag("h1") { "Breaking News!" }
tag("h2") { "Massassive Ruby Discovered" }

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end