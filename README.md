Websites Cookbook
====================
Allows for easy creation of Website configurations for apache2 on Debian (/Ubuntu) boxes.

Requirements
------------

#### packages
- `apache2` - The configurations are created for apache2.

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['websites']['default']</tt></td>
    <td>Boolean</td>
    <td>Whether apache's default site should be enabled</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
Include `websites` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[websites]"
  ]
}
```

Now you can create a data_bag named websites containing ```.json``` files that look like the following example:

```json
{
    "id": "default",
    "host": "app.local",
    "aliases": [
        "app.dev"
    ],
    "docroot": "/var/www/app/public"
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Bryan te Beek
