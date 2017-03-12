# chef-inspec Cookbook

Runs inspec compliance tests.
This is inspire by the [audit cookbook](https://github.com/chef-cookbooks/audit) but much simpler and without the dependency on chef compliance

## Requirements

### Platforms
Tested on:
  * Ubuntu 14.04
  * Ubuntu 16.04
  * CentOS 7.2

## Attributes

### chef-inspec::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['inspec']['version']</tt></td>
    <td>String</td>
    <td>Version of Inspec to use</td>
    <td><tt>latest</tt></td>
  </tr>
  <tr>
    <td><tt>['inspec']['gem_source']</tt></td>
    <td>String</td>
    <td>URL to the gem repository</td>
    <td><tt>https://rubygems.org</tt></td>
  </tr>
  <tr>
    <td><tt>['inspec']['profiles']</tt></td>
    <td>String</td>
    <td>List of the profiles to run</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['inspec']['options']</tt></td>
    <td>String</td>
    <td>Additional options to pass on to Inspec</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>['inspec']['fail_on_error']</tt></td>
    <td>String</td>
    <td>Fail the chef run if the Inspec tests aren't successful</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef-inspec::default

Include `chef-inspec` **at the end** of your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-inspec]"
  ]
}
```

The tests to be run are configured via the node['inspec']['profiles'] attribute:

```json
{
  "inspec": {
    "profiles": [
      "https://github.com/dev-sec/cis-docker-benchmark"
    ]
  }
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)x
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
