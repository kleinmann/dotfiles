# encoding: UTF-8
# This file is from from @holman's great dotfiles.
require 'rake'
require 'highline/import'

desc "Hook our dotfiles into system-standard positions."
task :install do
  encrypted = Dir.glob('*/*/**{.gpg}') | Dir.glob('*/**{.gpg}') | Dir.glob('*.gpg')
  passphrase = nil
  encrypted.each do |encrypted_file|
    passphrase ||= ask("Enter passphrase for encrypted files: ") { |q| q.echo = false }

    file = encrypted_file.split('/').last
    `gpg --batch --yes --passphrase "#{passphrase}" $PWD/#{encrypted_file}`
  end

  linkables = Dir.glob('*/*/**{.symlink}') | Dir.glob('*/**{.symlink}') | Dir.glob('*.symlink')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    # Early exit if on Mac OS X: Don't link linux-only configuration files.
    if `uname` =~ /Darwin/ && linkable =~ /linux\-configs/
      puts 'Skipping linux-only configuration on Mac OS X system.'
      next
    end

    if `uname` !~ /Darwin/ && linkable =~ /\/mac\//
      puts 'Skipping mac-only configuration on non-mac system.'
      next
    end

    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do
  linkables = Dir.glob('*/*/**{.symlink}') | Dir.glob('*/**{.symlink}') | Dir.glob('*.symlink')

  linkables.each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

  end
end

task :default => 'install'
