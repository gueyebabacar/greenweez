Wynd Api starter
================

   * [Installation](#installation)
      * [New with docker ?](#new-with-docker-)
      * [Steps](#steps)
   * [Test](#test)
   * [Add your controller](#add-your-controller)
   * [Auth](#auth)
      * [Create a certificate for JWT](#create-a-certificate-for-jwt)
      * [Load Default api user](#load-default-api-user)
      * [Login and get token](#login-and-get-token)
      * [Usage](#usage)
   * [Booking bundle](#booking-bundle)
      * [Installation](#installation-1)
      * [Usage](#usage-1)
   * [Maintenance page](#maintenance-page)
   * [More infos](#more-infos)

# Installation

## New with docker ?

Here is what you will need to do (only once on your computer) before accessing to the website.

Two possibilities (that we recommends):
- [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) - nginx proxy for docker containers
- [Docker DNS-gen](https://github.com/jderusse/docker-dns-gen) - DNS server for docker containers

You should read their readme and choose one. If you choose the first one, here is an example on how use it:

```bash
docker run -d \
    -p 80:80 \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --restart=always \
    --name proxy \
    jwilder/nginx-proxy

# if you have an error, stop the process that is using the port 80 (apache, nginx, ...) and play:
# docker start proxy

docker network create proxy
docker network connect proxy proxy
```

Then copy the `docker-compose.override.yml.dist` file into `docker-compose.override.yml` and uncomment all `networks`
parts. If you are using a server DNS, redirect all `.docker` domains to localhost. If not, you can edit your
`/etc/hosts` file and add new lines for each `VIRTUAL_HOST` of your `docker-compose.override.yml`. Example:

```
api.starter.docker            localhost
phpmyadmin.starter.docker     localhost
elasticsearch.starter.docker  localhost
mail.starter.docker           localhost
```

## Steps

*/!\ Warning /!\\*

If you had copy `docker-compose.override.yml.dist` into `docker-compose.override.yml`, the `api` service create volumes
using `~/.ssh` and `~/.composer`. Make sur that those directories already exists (if not, create them or remove them
from this file) otherwise docker will create them using the `root` user and can produce problems with permissions.

Don't keep "starter.docker" suffixes in `docker-compose.override.yml*`, you should adapt them with your project name.

```bash
$ make install
```

Then, if you use the `docker-compose.override.yml.dist` as base, you can access to
[the API](http://api.starter.docker/).  
And tools:
- [phpMyAdmin](http://phpmyadmin.starter.docker/)
- [ElasticSearch](http://elasticsearch.starter.docker/_plugin/head/) or [here](http://elasticsearch.starter.docker:9200/_plugin/head/)
- [MailDev](http://mail.starter.docker/)

# Test

URLs to test

```
/
/api  : Route of the api
/documentation : Route of the doc
```

# Extending wynd/api
## Add your controller

Add your own controller
Just edit in src/AppBundle/Controller make a controller who extends FOSRestController

```php
<?php

namespace AppBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;

class ApiController extends \WyndApi\WyndApiCoreBundle\Controller\BaseController
{
    /**
     * @ApiDoc(
     *   resource = true,
     *   description = "First api test",
     *   statusCodes = {
     *     200 = "Returned when successful",
     *     404 = "Returned when not found"
     *   }
     * )
     * @Rest\Get("/api")
     */
    public function indexAction(Request $request)
    {
        $view = $this->view(['foo' => 'bar'], Response::HTTP_OK)->setFormat('json');
        return $view;
    }
}
```

## Overriding entities

Can be useful to:
 - Adds fields
 - Changes field types
 - Change serialization groups

In wynd/api and others core bundle (booking per example), every entity meant to be extended/overridden is composed of free parts:
 - A class in the namespace Entity\Super. Lets call it the super class.
 - An interface (TagInterface or ProductInterface per example)
 - A class in the namespace Entity, extending the super class and implementing the interface. Lets call it the wynd/api entity.

Then, every association in doctrine is made using these interfaces and
a part of the wyn/api semantic configuration is used to map the interfaces to their correct implementation.

### Howto

1) Creates a new class in the Entity namespace of your project extending the super class and implement the entity interface.
2) Copy/paste the class comments of the wynd/api entity to your new class (the part with the `@ORM\Entity` annotation)
3) Register the new entity in the wynd/api semantic configuration. Example, in `app/config/config.yml`
4) Adds a migration altering the table

```yaml

app:
    wynd_api:
        wynd_resolve_target_entities: ~
            WyndApi\WyndApiCoreBundle\Entity\ProductInterface: Wynd\Starter\Entity\Product
```

**Note:** If the overridden entity is also used by Elasticsearch (Order, category and product) you also need to change it in the `app/config/elastica.yml` file.

## Overriding a controller

There is no special way to override a controller.
Just creates a new one using the same name.

You may also want to copy/paste the origin wynd/api controller (including the whole documentation block)
controller in order to keep the behaviour and documentation.

## Swagger documentation

The API the documented using swagger `https://website/api/documentation`.
This documentation is generated from 2 sets of annotations:
 1) The annotations in the controllers define the documentation of the api
 (the URLS, their required and optional parameters... But also the types returned in the response)
 2) The annotations in the class of the Documentation namespace define the model of the API.
 Meaning the different types and how they look like

If to override the documentation if a controller you must creates a new one and copy its whole doc block,
to override the model you just need to create new classes in the `AppBundle\Documentation` namespace extending the one in `WyndApi\WyndApiCoreBundle\Documentation`.
If the new class as the same name than one of wynd/api, then the model of the later will be replaced.

Example:
`AppBundle\Documentation\Product` replaces `WyndApi\WyndApiCoreBundle\Documentation\Super\Product`

## Migrations

Every Wynd bundle can add migrations (wynd/api, wynd/booking-api etc...) as can the AppBundle.
But the doctrine migrations needs to have all migrations in the same directory.
To solve this issue, the doctrine migrations bundle has been configured to read migrations in `var/DoctrineMigrations`
and a composer script copy the migrations of each bundle to this directory.

You can also sync the migrations manually:
 - `make copy-migrations` copy the missing migrations
 - `make copy-migrations-force` deletes all files in `var/DoctrineMigrations` and then copy the migrations from every bundle

**Note:** The schema does not support the generation of the migrations. You must write them manually.
**Note:** `docker-compose run --rm api bin/console doctrine:migrations:generate` can be used to generate
a new empty migration in `var/DoctrineMigrations`. Then you will need to move it to `app/DoctrineMigrations`

# Auth

## Create a certificate for JWT

```bash
$ make var/jwt/public.pem
```

## Load Default api user

admin_api : test
user_api : test

```bash
$ make db-fixtures
```

## Login and get token

username available admin|user

```bash
$ curl -X POST http://api.starter.docker/api/token-authentication -d username=user -d password=password
```

## Usage

set param in header "Authorization"="Bearer `your_token`"

# Booking bundle

## Installation

1. Register the bundle

    Uncomment the line `new \WyndApi\WyndBookingApiBundle\WyndBookingApiBundle(),` in `app/MicroKernel.php`

2. Adds the configuration

    Uncomment the `wynd_slot_destinations` entry in `app/config/parameters.yml.dist`

3. Adds the routing configuration

    Uncomment the `api_booking` entry in `app/config/routing.yml`

4. Install the bundle

    ```bash
    $ docker-compose run --rm api composer require wynd/booking-api
    ```
    
5. Execute Doctrine Migrations
   
    During Booking bundle installation, migrations may have been added so you need to execute
    ```bash
    $ make db-migrate
    ```

## Usage

# Maintenance page

Add `LexikMaintenanceBundle` to your Kernel file to activate maintenance page feature.

```yml
# Maintenance page
lexik_maintenance:
    authorized:
        cookie: { wynd_authorize: VeriTas@2016 }
    driver:
        # ttl: 3600
        # File driver
        class: '\Lexik\Bundle\MaintenanceBundle\Drivers\FileDriver'
        options: { file_path: %kernel.cache_dir%/lock }

    # Optional. response code and status of the maintenance page
    response:
        code: 503
        status: "Service Temporarily Unavailable"
```
With this minimal configuration you can enable maintenance page feature. It will write a lock file, you can still access website by setting a cookie named `wynd_authorize` with value `scoopful-tackle-stimuli`.

# More infos

[FOSRestBundle documentation](http://symfony.com/doc/1.7/bundles/FOSRestBundle/index.html)  
[Symfony MicroKernel article](http://symfony.com/blog/new-in-symfony-2-8-symfony-as-a-microframework)
