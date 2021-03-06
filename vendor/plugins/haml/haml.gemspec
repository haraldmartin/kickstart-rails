HAML_GEMSPEC = Gem::Specification.new do |spec|
  spec.name = 'haml'
  spec.summary = "An elegant, structured XHTML/XML templating engine.\nComes with Sass, a similar CSS templating engine."
  spec.version = File.read('VERSION').strip
  spec.author = 'Hampton Catlin'
  spec.email = 'haml@googlegroups.com'
  spec.description = <<-END
      Haml (HTML Abstraction Markup Language) is a layer on top of XHTML or XML
      that's designed to express the structure of XHTML or XML documents
      in a non-repetitive, elegant, easy way,
      using indentation rather than closing tags
      and allowing Ruby to be embedded with ease.
      It was originally envisioned as a plugin for Ruby on Rails,
      but it can function as a stand-alone templating engine.
    END
  #'

  readmes = FileList.new('*') do |list|
    list.exclude(/(^|[^.a-z])[a-z]+/)
    list.exclude('TODO')
    list.include('REVISION')
  end.to_a
  spec.executables = ['haml', 'html2haml', 'sass', 'css2sass']
  spec.files = FileList['lib/**/*', 'bin/*', 'test/**/*', 'Rakefile', 'init.rb'].to_a + readmes
  spec.autorequire = ['haml', 'sass']
  spec.homepage = 'http://haml.hamptoncatlin.com/'
  spec.has_rdoc = true
  spec.extra_rdoc_files = readmes
  spec.rdoc_options += [
    '--title', 'Haml',
    '--main', 'README.rdoc',
    '--exclude', 'lib/haml/buffer.rb',
    '--line-numbers',
    '--inline-source'
   ]
  spec.test_files = FileList['test/**/*_test.rb'].to_a
end
