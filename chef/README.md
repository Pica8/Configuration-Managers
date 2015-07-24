configure-manager Cookbook
==========================
The cookbook Installs/Configures PicOS.

Attributes
----------
#### configure-manager::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['configure-manager']['config_file']</tt></td>
    <td>String</td>
    <td>Name of PicOS configuretion file. It should be available in files folder of the cookbook</td>
    <td><tt>pica.conf</tt></td>
  </tr>
  <tr>
    <td><tt>['configure-manager']['dir']</tt></td>
    <td>String</td>
    <td>Folder path for configs</td>
    <td><tt>/pica/config/</tt></td>
  </tr>  
</table>

Usage
-----
#### configure-manager::default

Just include `configure-manager` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[configure-manager]"
  ]
}
```

