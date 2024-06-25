# rstudio-spatial-omics

This repository contains the Docker configuration for setting up an RStudio environment tailored for spatial omics analysis. It includes various R packages and dependencies specifically chosen to facilitate the analysis and visualization of spatial omics data.

## Getting Started

To use this Docker image, you need to have Docker installed on your machine. If you do not have Docker installed, please follow the instructions on the [official Docker website](https://docs.docker.com/get-docker/) to get Docker set up on your system.

### Installation

1. Clone this repository to your local machine using:

    ```bash
    git clone https://github.com/maurya-anand/rstudio-spatial-omics.git
    ```

1. Navigate into the cloned repository:

   ```bash
   cd rstudio-spatial-omics
   ```

#### Usage with Docker Compose

The `compose.yml` file is configured to build the RStudio image, mount a volume for persistent workspace data, and set up necessary environment variables for running the container. Here's a brief overview of the configuration:

- **build:** Specifies the directory of the Dockerfile, in this case, the current directory (`.`).
- **volumes:** Mounts the current directory to `/home/rstudio/workspace` inside the container, allowing for persistent data storage and easy file transfer between the host and the container.
- **ports:** Maps port 8787 on the host to port 8787 on the container, enabling access to the RStudio server through the host's web browser.
- **environment:** Sets environment variables to disable authentication (`DISABLE_AUTH=true`), remove the session timeout (`RSTUDIO_SESSION_TIMEOUT=0`), and specify user and group IDs (`USERID=1001`, `GROUPID=1001`) for file permissions.

##### Running with Docker Compose

1. Navigate to the directory containing your `compose.yml` file.
1. Run the following command to build and start the RStudio container:

   ```bash
   docker compose up -d
   ```

1. To stop and remove the container

   ```bash
   docker compose down
   ```

##### Running the Container without Docker compose

1. Build the Docker image:

   ```bash
   docker build -t rstudio-spatial-omics .
   ```

1. After building the image, you can run the container using:

   ```bash
   docker run --rm -d -p 8787:8787 -e DISABLE_AUTH=true --name rstudio-spatial rstudio-spatial-omics
   ```

### Accessing RStudio

Once the container is running, open your web browser and go to http://localhost:8787.
