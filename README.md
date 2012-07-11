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