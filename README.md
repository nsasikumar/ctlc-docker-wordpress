ctlc-docker-wordpress
==================

Base docker image to run a WordPress


Usage
-----

To create the image `ctlc/wordpress`, execute the following command on the ctlc-docker-wordpress folder:

    sudo docker build -t ctlc/wordpress .

Running the WordPress container
------------------------

Run the `/run.sh` script to start WordPress (via Docker supervisor):

    ID=$(sudo docker run -d -p 80 ctlc/wordpress /run.sh)

It will store the new container ID (like `d35bf1374e88`) in $ID. Get the allocated external port:

    sudo docker port $ID 80

It will print the allocated port (like 4751). Test your deployment:

    curl http://0.0.0.0:4751/readme.html

Done!

Environment variables
------------------------
*  DB_NAME -- The name of the database for WordPress
*  DB_USER -- MySQL database username
*  DB_PASSWORD -- MySQL database password
*  DB_HOST -- MySQL hostname

(or alternatively)

*  DB_1_PORT_3306_TCP_ADDR
*  DB_1_PORT_3306_TCP_PORT

Changelog
------------------
2014-09-08 - Update to WordPress 4.0
