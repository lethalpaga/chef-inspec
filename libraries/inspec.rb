
def inspec_run(profile, options)
  require 'inspec'
  #Chef::Log.info "Running inspec..."
  runner = ::Inspec::Runner.new(options)
  runner.add_target(profile)
  runner.run
end