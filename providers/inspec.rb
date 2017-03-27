
def load_current_resource
  @current_resource = Chef::Resource::ChefInspecInspec.new(@new_resource.name)
  @current_resource.profile(@new_resource.profile)
  @current_resource.options(@new_resource.options)
end

action :check do
    converge_by("Running Inspec check.") do
        res = inspec_run(@current_resource.profile, @current_resource.options)
        if res != 0
            Chef::Log.error "Compliance check failed. #{@new_resource.fail_on_error ? "Failing" : "Not failing"} Chef run"
            fail "Compliance check failed" if @new_resource.fail_on_error
        end
        @new_resource.result = res
        @new_resource.updated_by_last_action(true)
    end
end
