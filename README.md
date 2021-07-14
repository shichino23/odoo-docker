# REQUIREMENT
> docker pull postgres

Be sure image postgres installed on a server (Copy image to from another to server) 

> docker run --name db -p 8006:5432 -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=admin@123 -e POSTGRES_DB=postgres -d postgres


# CREATE DOCKER IMAGE
Run script
> docker build -t `odoo:<version>` `<path_to_docker_file>`

- For add external libraries: \
    + Add line inside file `requirements_extra.txt`
    + Then Run again script create docker image

# EXPORT IMAGE
Run script
> docker save -o `<path>/images.tar` `odoo:<version>`

# IMPORT IMAGE TO ANOTHER DOCKER
- Copy file images.tar to folder
- Then run script 
> docker load -i `<path>/images.tar`

# RUN CONTAINER WITH IMAGE

> docker run -d -v `<path>/config:/etc/odoo` -v `<path>/addons:/mnt/extra-addons` -p 8010:8069 --name odoo --link db:db -t `odoo:<version>`

# EXPOSE PORT
- odoo: 8010
- postgres: 8006
