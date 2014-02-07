install-driven-plugin
=====================

The `install-driven-plugin` script in the `bin` directory will install the [Driven plugin for
Cascading](http://cascading.io/driven) in the current users environment. The plugin is not installed by default, you
have to install it yourself, if you want to use Driven. The plugin will be installed in
`$HOME/.cascading/.driven-plugin`. 

Installing the plugin will cause every Cascading based application to send telemetry to `https://driven.cascading.io`.
If you no longer want this to happen, you can simply delete the installation directory of the plugin mentioned above.

For more information about driven, please read the [Driven
documentation](http://docs.cascading.io/driven/1.0/getting-started/index.html).
