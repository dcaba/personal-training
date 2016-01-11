Gem::Specification.new do |s|
	s.name         = "dcaba_studio_game"
	s.version      = "0.1.1"
	s.author       = "Daniel Caballero"
	s.email        = "dcaba@github.com"
	s.homepage     = "https://github.com/dcaba/personal-training/tree/master/studio_game"
	s.summary      = "Ruby trainig exercise for pragmatic studio"
	s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
	s.licenses     = ['MIT']

	s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
	s.test_files    = Dir["spec/**/*"]
	s.executables   = [ 'studio_game' ]

	s.required_ruby_version = '>=1.9'
	s.add_development_dependency 'rspec'
end
