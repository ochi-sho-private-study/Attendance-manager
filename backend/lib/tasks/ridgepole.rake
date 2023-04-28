# frozen_string_literal: true

# rubocop:disable Rake/MethodDefinitionInTask, Metrics/BlockLength
namespace :ridgepole do
  desc 'ridgepole --apply'
  task apply: :environment do
    ridgepole! '--apply'
    Rake::Task['db:schema:dump'].invoke
    Rake::Task['annotate_models'].invoke if Rails.env.development?
  end

  private

  def schemafile
    Rails.root.join('schemafile.rb')
  end

  def configfile
    Rails.root.join('config/database.yml')
  end

  def ridgepole!(*args)
    options.each do |option|
      system "bundle exec ridgepole #{[option + args].join(' ')}"
    end
  end

  def options
    common_options = [[
      "-E #{Rails.env}",
      "-c #{configfile}",
      "-f #{schemafile}",
      '--bulk-change',
      '--drop-table'
    ]]
    return common_options unless Rails.env.development?

    common_options.push ['-E test', "-c #{configfile}", "-f #{schemafile}", '--bulk-change', '--drop-table']
  end
end
# rubocop:enable Rake/MethodDefinitionInTask, Metrics/BlockLength
