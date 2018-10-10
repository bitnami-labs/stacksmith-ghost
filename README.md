# Generic application with DB (MySQL): Ghost

This is an example to show how to deploy a web application using the `Generic application with DB (MySQL)` stack template in [Bitnami Stacksmith](stacksmith.bitnami.com).

We chose [Ghost](https://ghost.org/):

> Ghost is a fully open source, hackable platform for building and running a modern online publication. We power blogs, magazines and journalists from Zappos to Sky News.

## Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Create a new application and select the _Generic application with DB (MySQL)_ stack template.
3. Select the targets you are interested on (AWS,Kubernetes,...)
4. We created a [_env_](files/env) to keep common configuration along our scripts. Upload it from the [_files_](files/) folder as an application file.
5. Select `Git repository` for the application scripts and paste the URL of this repo. Use `master` as the `Repository Reference`.
6. Click the <kbd>Create</kbd> button.
7. Launch it in [AWS](https://stacksmith.bitnami.com/support/quickstart-aws) or download the helm chart to run it in [Kubernetes](https://stacksmith.bitnami.com/support/quickstart-k8s)
8. Access your application: http://IP:8080

Stacksmith will compare the latest commit for a reference (e.g. new commits made to a branch) against the last commit used during packaging. If there are any new commits available, these will be available to view within the Repository Details pane in the application history. If you choose to repackage your application, these newer commits will be incorporated and used during the packaging.


## Use the Stacksmith CLI for automating the process

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com), create a new application and select the _Generic application with DB (MySQL)_ stack template.
2. Install [Stacksmith CLI](https://github.com/bitnami/stacksmith-cli) and authenticate with Stacksmith.
3. Edit the `Stackerfile.yml`,  update the `appId` with the URL of your project.
5. Run the build for a specific target like `aws` or `docker`. E.g.

   ```bash
   stacksmith build --target docker
   ```
6. Wait for app to be built and deploy it in your favorite target platform.

## Scripts

In the `stacksmith/user-scripts` folder, you can find the required scripts to build and run this application:

### build.sh

This script takes care of extracting the application and installing dependencies. It performs the next steps:

* Install required extra system packages
* Copy the uploaded file
* Install Ghost dependencies
* Create a non-root user to run the application

### boot.sh

This script takes care of initializing the database and configuring the application: Basically, it does:

* Create a configuration file with server and database connections
* Initialize and populate the database

### run.sh

This script takes care of starting the application by running `node index.js`.
