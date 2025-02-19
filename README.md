# DevOps Project: Docker Game Deployment to AWS

This project outlines the steps to create a simple game using Docker and deploy it to AWS using Elastic Beanstalk.

## Prerequisites

*   An AWS account.
*   Docker installed on your local machine.
*   Basic understanding of Docker concepts.

## Steps

1.  **Create a Dockerfile**:

    *   Create a project folder, e.g., `2048`.
    *   Create a `Dockerfile` inside the project folder. Ensure the 'D' is capital.
    *   Specify a base image using the `FROM` instruction. Ubuntu `22.04` is recommended.
        ```dockerfile
        FROM ubuntu:22.04
        ```
    *   Use the `RUN` instruction to update packages and install necessary utilities like `nginx`, `zip`, and `curl`:
        ```dockerfile
        RUN apt-get update
        RUN apt-get install -y zip nginx curl
        ```
    *   Configure `nginx` by echoing `'daemon off'` into the `nginx.conf` file.
    *   Use `curl` to download the game repository into the `/var/www/html/` directory.
    *   Unzip the downloaded file and move the contents to the appropriate directory.
    *   Expose port 80 to make the game accessible via a web browser:
        ```dockerfile
        EXPOSE 80
        ```
    *   Use the `CMD` instruction to start `nginx`:
        ```dockerfile
        CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
        ```

2.  **Build the Docker Image**:

    *   Open a terminal and navigate to the directory containing the `Dockerfile`.
    *   Run the command `docker build -t 2048-game .` to build the Docker image. The dot "." signifies that the Dockerfile is in the current directory.
    *   Verify the image creation by running `docker images`.

3.  **Create a Docker Container**:

    *   Run the command `docker run -d -p 80:80 <image ID or name>` to create a container from the Docker image.
    *   Access the game in a web browser by navigating to `localhost`.

4.  **Deploy to AWS Elastic Beanstalk**:

    *   Open the AWS Management Console and navigate to Elastic Beanstalk.
    *   Create a new application and environment, choosing the **Docker platform**.
    *   Upload the `Dockerfile` as the application code.
    *   Configure any additional options, such as high availability or load balancing, or stick to the free tier.
    *   Elastic Beanstalk will automatically provision the necessary infrastructure.
    *   Once the environment is up and running, access the application via the provided CNAME.

5.  **Clean Up**:

    *   After showcasing the project, delete the application and environment in Elastic Beanstalk to avoid incurring charges.
