# Nginx Docker Image on Alpine

This is a simple `nginx` installation running on Alpine Linux. It utilizes the official `nginx:1.10-alpine` release and updates the configuration, setting `/var/www/app/webroot` as the document root. It also sets up the `fast-cgi` configuration to pass `php` requests to a container at the following URL:  `php-fpm:9000`. See below for more details.

This image is created to enhance my own workflow. You are more than welcome to use it, if you are interested.

To use this image in your own Dockerfiles, add it to your FROM statement:

    FROM jkilbride/nginx-alpine

---
I have customized the shell by adding `aliases.sh` to the `/etc/profile.d` directory and enabling the `color_prompt.sh` file. Be aware that I prefer `vi` keybindings. If you prefer the default `emacs` keybindings, type `set -o emacs` at the command prompt.

## PHP-FPM

This image is designed to work with my `php-fpm` image:  `jkilbride/php-fpm-alpine`. To run these two images together, download the `docker-compose.yml` file from my repo and type `docker-compose up -d`. Then point your web browser to `http://[your-docker-host]:8080/info.php`. You should see the output of the `phpinfo()` command. See the [Docker documentation on docker-compose](https://docs.docker.com/compose/overview/) for more info.

For a more interesting example, you can inject your own codebase into the `/var/www/app/webroot` directory of the `php-fpm-alpine` image using a bind mount or a data volume. See the [Docker documentation on volumes](https://docs.docker.com/engine/userguide/containers/dockervolumes/) for more info. This is meant to be a simple example of connecting `nginx` and `php-fpm` on `alpine`, and can be used as the starting point for much more complex environments.

## Maintainer

* [Jeff Kilbride](https://github.com/jeff-kilbride) jeff@kilbride.com

## Caveats

As Alpine Linux uses musl, you may run into some issues with environments expecting glibc-like behaviour (for example, Kubernetes). Some of these issues are documented here:

* http://gliderlabs.viewdocs.io/docker-alpine/caveats/
* https://github.com/gliderlabs/docker-alpine/issues/8

## License

The code is available under the [MIT License](/LICENSE).