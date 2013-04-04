Websites Cookbook
====================
Allows for easy creation of Website configurations for apache2 on Debian (/Ubuntu) boxes.

Requirements
------------

#### packages
- `apache2` - The configurations are created for apache2.

Usage
-----
Just include `websites` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[websites]"
  ]
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
