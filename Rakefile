require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

# Compile the C extension
desc "Compile the native extension"
task :compile do
  build_dir = 'build'
  FileUtils.rm_rf(build_dir)
  FileUtils.mkdir_p(build_dir)
  
  # Copy source files to build directory
  FileUtils.cp_r('ext/thaw/.', build_dir)
  
  Dir.chdir(build_dir) do
    sh 'ruby extconf.rb'
    sh 'make'
    
    # Copy compiled extension to lib directory for development
    extension_files = Dir['thaw_native.{bundle,so,dll}']
    if extension_files.empty?
      puts "Warning: No compiled extension found"
    else
      extension_file = extension_files.first
      target_dir = '../lib/thaw'
      FileUtils.mkdir_p(target_dir)
      FileUtils.cp(extension_file, target_dir)
      puts "Copied #{extension_file} to #{target_dir}/"
    end
  end
end

# Clean compiled files
desc "Clean compiled extension files"
task :clean do
  # Clean build directory
  FileUtils.rm_rf('build')
  # Clean lib directory of copied extensions
  FileUtils.rm_f(Dir['lib/thaw/thaw_native.{bundle,so,dll}'])
  # Clean built gems
  FileUtils.rm_f(Dir['*.gem'])
  # Clean any stray build artifacts in ext/ (shouldn't exist now, but just in case)
  Dir.chdir('ext/thaw') do
    FileUtils.rm_f(Dir['thaw_native.{bundle,so,dll,o}'])
    FileUtils.rm_f(Dir['*.{bundle,so,dll,o,def}'])
    FileUtils.rm_f('Makefile')
    FileUtils.rm_f('mkmf.log')
  end
  puts "Cleaned all build artifacts"
end

# Deep clean - like autotools distclean
desc "Clean all generated files (including development gems)"
task :distclean => :clean do
  FileUtils.rm_rf('vendor/bundle')
  FileUtils.rm_f('Gemfile.lock')
  puts "Deep clean completed"
end

# Make tests depend on compilation
task :spec => :compile

task :default => :spec
