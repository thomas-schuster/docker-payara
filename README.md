# Docker Payara
Is a simple project in which Docker composes three application services. Its basis is three images
1. The latest [payara full server](https://github.com/payara/docker-payaraserver-full) 
2. The latest [postgres](https://hub.docker.com/_/postgres/)
3. The [pgadmin4](https://hub.docker.com/r/dpage/pgadmin4)

## Scenario
The main idea of this service composition is to provide a test environment for development based on payara server. The included Dockerfile is used to modify the domain configuration of the payara full server so that it instantly offers a connection resource to a PostgreSQL database (as configured in the provided compose file).

## Environment Variables
The following environment variable have been set within as defaults with the service configuration:
1. For payara full server
   - standard ports for deployment, administration and applications are mapped
   - domain configuration adjusted to postgres service
2. For PostgreSQL:
   - standard port is mapped
   - database: swtapplication
   - username: postgres
   - password: adminadmin
3. For pgadmin4:
   - web application mapped to port 80
   - username: user
   - password: secret

Please change this as needed. Keep in mind to also change the domain configuration once you tweak the database settings.

## Volumes
For payara full server a deployment folder is a shared [volume](https://docs.docker.com/storage/volumes/). You may place applications there to deploy them on service startup. In order to deploy or redeploy applications at a later time, please use remote deployment. For pgadmin4 another volume that pre-configures the connection to the PostgreSQL service's database is shared.
For windows hosts, you will also have to [activate volume sharing](https://docs.docker.com/docker-for-windows/#shared-drives) first.

## Service Start 
To start all services you simply have to build and tag the payara image as 'payara'. On commandline:
```
docker build --tag=payara .
docker-compose up
```
Although this is only two instructions on command lines I've added the startservice scripts (bat for Windows and sh for Linux).
