#
# adds 'brew refresh' as an external command, which essentially does
# 'brew update' followed by 'brew outdated'
#
require 'update'

def outdated
  outdated_brews.each do |keg, name, version|
    if $stdout.tty? and not ARGV.flag? '--quiet'
      versions = keg.cd{ Dir['*'] }.join(', ')
      puts "#{name} (#{versions} < #{version})"
    else
      puts name
    end
  end
end

abort "Please `brew install git' first." unless system "/usr/bin/which -s git"

updater = RefreshBrew.new
unless updater.update_from_masterbrew!
  puts "Already up-to-date."
else
  puts "Updated Homebrew from #{updater.initial_revision[0,8]} to #{updater.current_revision[0,8]}."
  ## New Formulae
  if updater.pending_new_formulae?
    ohai "The following formulae are new:"
    puts_columns updater.added_formulae
  end
  ## Deleted Formulae
  if updater.deleted_formulae?
    ohai "The following formulae were removed:"
    puts_columns updater.deleted_formulae
  end
  ## Updated Formulae
  if updater.pending_formulae_changes?
    ohai "The following formulae were updated:"
    puts_columns updater.updated_formulae
  else
    puts "No formulae were updated."
  end
end
if outdated_brews.length > 0
  ohai "The following formulae are outdated:"
  outdated
end