# Cascading 2.0 SDK

This project contains the build scripts for creating the Cascading SDK release.

The SDK distribution includes Cascading 2.0 and any related projects in a single archive.

Every project or extension included in this SDK has been tested independently before being downloaded and
included in the package created by these build scripts.

## Downloading the latest SDK release

To download a copy of the Cascading SDK, execute the following command:

```bash
 > wget -i http://files.concurrentinc.com/sdk/2.0/latest.txt
```

## Tools

This SDK includes a few prebuilt tools. To add them to your PATH, call:

```bash
 > export CASCADING_SDK_HOME=<sdk install path>
 > source <sdk install path>/etc/setenv.sh
```

## Building the SDK

To build a local version of the SDK package, execute the following command:

```bash
 > gradle packageDist
```

## Redistribution

This SDK was created to make it easier for third-parties to redistribute Cascading and any related
documentation and sub-projects.

Because the SDK includes many pre-built binaries and tools, it is important that each third-party shipping
this SDK along with their own Hadoop distribution, that they "certify" their distribution as being both
binary and functionally compatible.

### Binary Compatibility

This SDK includes the Cascading Compatibility project under 'tools/compatibility'. This project is also
available on GitHub at https://github.com/Cascading/cascading.compatibility.

Please follow the instructions on the README.md file to run the binary compatibility test.

### Functional Compatibility

To test Cascading on a running cluster, this SDK includes the Cascading Load project under 'tools/load-<release date>'.
This project is also available on GitHub at https://github.com/Cascading/cascading.load.

Please run the Load application on a given cluster with the following switches:

```bash
  > hadoop jar load-<release-date>.jar --certify-tests -I input -O output -W working
```

This will execute a set of preconfigured work loads to verify any standard Cascading application can run at scale.