require 'fileutils'

files = Dir.glob("traffic.libsyn.com/**/**mp3*")

files = [files[0]]

FileUtils.mkdir_p("files")

files.each do |file|
  new_file_name = file.
    gsub(/traffic\.libsyn\.com\/chatwithtraders\/(.*\.mp3).*/) { $1 }.
    gsub(/([\_a-zA-Z])3?B?20/) { "#{$1}_" }.gsub(/_+/, '_')

  new_file_name = File.join('files', new_file_name)

  puts "symlinking: #{file} => #{new_file_name}""

  FileUtils.ln(file, new_file_name)
end
