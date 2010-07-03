#!/usr/bin/ruby
require "pp"
require "yaml"
$outs = Array.new
$current_snippet = ""
$currrent_docline = []
ARGF.each {|line|
  if line =~ /^## (.+)/
    $current_docline << line.gsub(/^## (.+)/, "\\1").strip
  end
  if line =~ /^snippet (.+)/
    $current_snippet = line.gsub(/^snippet (.+)/, "\\1").strip
    $outs << {:name => $current_snippet, :docs => $current_docline}
    $current_snippet = ""
    $current_docline = []
  end
}

metadata = YAML.load_file("metadata.yml")

output_html = "<!DOCTYPE html>\n"
output_html += "<html><head><title>SnipMate Doc: #{metadata["name"]}</title>\n"
output_html += "<style type=\"text/css\">dl { padding: 0.5em; } dt { float: left; clear: left; width: 100px; text-align: right; } dt:after { content: \":\"; } dd { margin: 0 0 0 110px; padding: 0 0 0.5em 0; }</style>"
output_html += "</head><body><h1>SnipMate Doc: #{metadata["name"]}</h1>\n"
output_html += "<p>#{metadata["author"]} <a href=\"mailto:#{metadata["contact"]}\">#{metadata["contact"]}</a></p><dl>\n"

$outs.each {|snip|
  output_html += "<dt>#{snip[:name]}</dt>\n"
  if snip[:docs] != nil && snip[:docs] != []
    snip[:docs].each {|docline|
      output_html += "<dd>#{docline}</dd>\n"
    }
  else
    output_html += "<dd>&nbsp;</dd>\n"
  end
}
output_html += "</dl></body></html>"
puts output_html