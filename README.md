# Cascading 2.0 SDK

This project contains the build scripts for creating the Cascading SDK release.

The SDK distribution, available online, includes Cascading 2.0 and any related projects in a single archive.

Every project or extension included in this SDK has been tested independently before being downloaded and
included in the package created by these build scripts.

# Getting Started

This SDK includes `source`, `docs`, and `tools` subdirectories.

## Source

The `source` subdirectory includes the latest release of Cascading and many sample applications and
any related API docs.

## Docs

The `docs` subdirectory includes the Cascading User Guide, and any related tutorials.

## Tools

The `tools` subdirectory includes a few prebuilt command line tools. To add them to your PATH, call:

```bash
 > export CASCADING_SDK_HOME=<sdk install path>
 > source <sdk install path>/etc/setenv.sh
```

## Downloading the latest SDK release

To download a current copy of the Cascading SDK release, execute the following command:

```bash
 > wget -i http://files.cascading.org/sdk/2.0/latest.txt
```

## Installing on AWS Elastic MapReduce

To pre-install the SDK on a new instance of AWS EMR, use the following bootstrap action:

    s3://files.cascading.org/sdk/2.0/install-cascading-sdk.sh

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

    --bootstrap-action s3://files.cascading.org/sdk/2.0/install-cascading-sdk.sh --args "--tmpdir,/tmp"

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