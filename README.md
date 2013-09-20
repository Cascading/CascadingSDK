# Cascading 2.2 SDK

This project contains the build scripts for creating the Cascading SDK release.

The SDK distribution, available online, includes Cascading 2.2 and related projects in a single archive.

Every project or extension included in this SDK has been tested independently before being downloaded and
included in the package created by these build scripts.

# Getting Started

This SDK includes `binary`, `source`, `docs`, `preview`, `thirdparty` and `tools` subdirectories. 
The following paragraphs describe those subdirectories.


## Binary

The `binary` subdirectory contains the latest version of all cascading jars,
their dependencies and the javadoc.


## Source

The `source` subdirectory includes the latest release of Cascading and many sample applications and
any related API docs.

## Docs

The `docs` subdirectory includes the Cascading User Guide, the linugal
documentation, and the source and docs of the tutorial series ["Cascading for
the Impatient"](http://docs.cascading.org/impatient/).

## Preview

The `preview` subdirectory includes projects from the Cascading eco-system, that are not yet released.
Projects in the `preview` can change between versions of the SDK or move out of
the this directory or dissapear. Please do not rely on them for production code.

Currently the `preview` directory contains the source code of
[`pattern`](http://www.cascading.org/pattern/) in the `preview/pattern-src`
directory and the [pattern
turial](http://docs.cascading.org/tutorials/pattern/) in
`preview/pattern-tutorial`.

### Pattern

> Pattern is a Cascading library and framework for machine learning model scoring at
> scale on Apache Hadoop.

## Thirdparty

The `thirdparty` subdirectory contains open source libraries and tools built on
top of cascading, which are developed in their own communities. Currently these
are [scalding](http://github.com/twitter/scalding) and
[cascalog](http://github.com/nathanmarz/cascalog).

### Scalding

> Scalding is [Scala](http://www.scala-lang.org/) API for Cascading developed by
> [twitter](http://twitter.com). 

The SDK includes the source code of scalding as well as a ready to use tutorial
project to get you started with scalding. 


The scalding code is in `thirdparty/source/scalding-src` and the tutorial in
`thirdparty/source/scalding-tutorial`. 

**Note:** In order to follow the tutorial you have to have
[`SBT`](http://www.scala-sbt.org/) installed. For more information see
`thirdparty/source/scalding-tutorial/README.md`.

### Cascalog

> Cascalog is fully-featured data processing and querying library
> for [Clojure](http://clojure.org/) or Java.

The SDK includes the source code of cascalog and a ready to go project for the
cascalog tutorial. You find the source code in `thirdparty/source/cascalog-src`
and the tutorial in `thirdparty/binary/cascalog-tutorial`.

**Note:** In order to follow the cascalog tutorial you have to have
[`leiningen 2`](http://leiningen.org/) installed. For more information see
`thirdparty/binary/cascalog-tutorial/README.md`

## Tools

The `tools` subdirectory includes prebuilt command line tools. To add them to your PATH, call:

```bash
 > export CASCADING_SDK_HOME=<sdk install path>
 > source $CASCADING_SDK_HOME/etc/setenv.sh
```

**Note:** You might see a warning, that you don't have leiningen or sbt
installed, when sourcing `setenv.sh` script. Having those tools installed, is
only necessary, if you want to follow the `scalding` or `cascalog` tutorials,
the rest of the SDK, does not rely on them.

The tools you will find are `multitool`, `load`, `compatibility` and
`lingual-client`

### Multitool

> Multitool provides a simple command line interface for building data
> processing jobs. Think of this as grep, sed, and awk for Hadoop, which also
> supports joins between multiple data-sets.



### Lingual

> Lingual is true SQL for Cascading and Apache Hadoop.
> Lingual includes JDBC Drivers, SQL command shell, and a catalog manager for
> creating schemas and tables.


### Load

> Load provides a simple command line interface for building high load cluster
> jobs, based on Cascading.




## Downloading the latest SDK release

To download a current copy of the Cascading SDK release, execute the following command:

```bash
 > wget -i http://files.cascading.org/sdk/2.2/latest.txt
```

## Installing on AWS Elastic MapReduce

To pre-install the SDK on a new instance of AWS EMR, use the following bootstrap action:

    s3://files.cascading.org/sdk/2.2/install-cascading-sdk.sh

This will download the latest SDK, unarchive it into the default user home directory, and add any tools
to the PATH.

This bootstrap action has the following arguments:

    # Usage:
    #  --user-home - an alternative user to install into, default /home/hadoop
    #  --tmpdir - an alternative temporary directory, default TMPDIR or /tmp if not set
    #  --no-screen - do not install screen, screen is installed by default on the master as a convenience
    #  --latest - url to text file referencing the latest version
    #  --no-bash - do not update .bashrc

When using a bootstrap action with the EMR ruby client, remember to use commas instead of spaces between arguments:

    --bootstrap-action s3://files.cascading.org/sdk/2.2/install-cascading-sdk.sh --args "--tmpdir,/tmp"

# Other

## Redistribution

This SDK was created to make it easier for third-parties to redistribute Cascading and any related
documentation and sub-projects.

To get the latest redistributable package follow the download instructions above.

Because the SDK includes many pre-built binaries and tools it is important that each third-party shipping
this SDK along with their own Hadoop distribution "certify" their distribution as being both
binary and functionally compatible.

### Binary Compatibility

This SDK includes the Cascading Compatibility project under `tools/compatibility`. This project is also
available on GitHub at https://github.com/Cascading/cascading.compatibility.

Please follow the instructions on the README.md file to run the binary compatibility test.

### Functional Compatibility

To test Cascading on a running cluster, this SDK includes the Cascading Load project under `tools/load-<release date>`.
This project is also available on GitHub at https://github.com/Cascading/cascading.load.

Please run the Load application on a given cluster with the following switches:

```bash
  > hadoop jar load-<release-date>.jar --certify-tests -I input -O output -W working
```

This will execute a set of preconfigured work loads to verify any standard Cascading application can run at scale.

## Building the SDK

To build a local version of the SDK package, execute the following command:

```bash
 > gradle packageDist
```

Note downloading the pre-built release is the preferred method.
