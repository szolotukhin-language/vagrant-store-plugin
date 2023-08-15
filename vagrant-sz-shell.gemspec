require_relative "lib/vagrant-sz-shell/version"

Gem::Specification.new do |spec|
  spec.name = "vagrant-sz-shell"
  spec.version = VagrantPlugins::VagrantSzShell::VERSION
  spec.authors = ["serhij.zolotukhin"]
  spec.email = ["serhij.zolotukhin@gmail.com"]

  spec.summary = "My first plugin"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
