# encoding: utf-8

require 'asciidoctor'

desc "Generate html pages"
task :generate, [:output_dir] do |t, args|
  Asciidoctor.convert_file 'index.adoc', :to_dir => args.output_dir, :safe => 'safe'
end


task :default => :generate do
end
