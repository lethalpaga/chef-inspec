
def load_current_resource
  @current_resource = Chef::Resource::ChefInspecAlwaysRun.new(@new_resource.name)
end

action :run do
    converge_by("Running AlwaysRun resource") do
        @new_resource.updated_by_last_action(true)
    end
end
