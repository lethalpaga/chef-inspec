#resource_name :inspec
actions :check
default_action :check

attribute :profile, name_attribute: true, kind_of: String, required: true
attribute :options, kind_of: Hash, default: {}

attr_accessor :result