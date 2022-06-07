# About
This directory is meant for hosting FHIR IGs' source code. One directory per IG. There are two IG source code examples to help with getting started.

* The IG under the [ig-starter-r4](ig-starter-r4) directory is based on [the FHIR/sample-ig](https://github.com/FHIR/sample-ig) with few possible changes or additions. See [ig-starter-r4/README-FW.md](ig-starter-r4/README-FW.md) for further details.
* The IG under the [minimal-r4] is a minimal configuration for having a clean IG build. Use this IG as a starting point if you'd like to start from scratch and gradually add what is needed. You can use the above IG for learning about the various features that can be used in this IG.

Both of the above IGs have a `build.sh` script that builds the IG with my Publisher Docker images [published here](https://hub.docker.com/repository/docker/sessaid/ig-publisher) and [configured and built here](https://github.com/ShahimEssaid/docker-hl7-fhir-ig-publisher).  The `build.sh` script will use the latest IG Publisher version within a day from when it is released as long as the Docker build was successful.

The IG folder's name needs to be suffixed with `-r4` or `-r5` to get JSON Schema support for editing the IG's content. See [../schemas/README.md](../schemas/README.md) for further details.

See the `build.sh` script to understand how to run the image until there is more documentation. Few pointers until then:
* FSH is detected by the Publisher and SUSHI will be run before the standard publishing process. However, SUSHI is not installed in the Docker image, it is installed during the build and the `fsh.ini` file is needed to indicate which SUSHI version to use. You can edit this file to specify the SUSHI version you need. 
* You can also specify the Publisher version you'd like to use by editing the Docker image tag in the `build.sh` file as long as such an image is built. Open a ticket against [the Docker build repository](https://github.com/ShahimEssaid/docker-hl7-fhir-ig-publisher/actions) if you need other versions.