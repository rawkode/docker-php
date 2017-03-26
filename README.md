# Sensible Docker Image for PHP Projects


A Docker image that aims to make your life easier, not a pain in the ass ... assuming you're running PHP on Apache (for now).


## Usage


### Step 1 - Integrating


Add your `Dockerfile`:

```Dockerfile
FROM rawkode/php:kickass
```

Modify your `docker-compose.yml`
```yaml
services:
  my-kickass-app:
    build:
      context: .
```


### Step 2 - System Packages


If you need some additional system dependencies, they will be satisfied if you provide a `packages.txt` file in the root of your project.


```
vim
jq
```


### Step 3 - PHP Extensions


If you need some additional PHP extensions, they will be satisfied if you provide a `php-extensions.txt` file in the root of your project.


```
pdo
mcrypt
```


### Step 4 - Composer


Composer will be installed automatically and available within your image. If you have a `composer.json`, this image will automatically install your dependencies.



### Step 5 - Configuring


1. Want to change the name of those files? Well, I'll let you add a prefix; I'm assuming it may me `.`, so you can hide them.
2. Need to change the composer arguments to the `install` command?


```yaml
services:
  my-kickass-app:
    build:
      context: .
      args:
        FILE_PREFIX: .
        COMPOSER_ARGS: --no-dev # Default
```


### Step 6 - Enjoy Life


> It's too short to be wasting your time dealing with this shit.
>
>   ~ @rawkode


## FAQ


### Question 1 - Why?

I do love an existential question! I started using Docker to make my life easier, not a pain in the ass. Currently PHP and Composer are separate 
"official" images and do not reflect how the PHP developer works with their code.

I had a bit of a [rant](https://twitter.com/dr4goonis/status/845313850996088832) on Twitter, so I decided to publish the Docker setup I use across my clients.


### Question 2 - Will there be a PHP 5 or Alpine version?

If somebody asks


### Question 3 - Why Apache?

It's simple, fast and Just Works &trade;. It fits well with the process model of Docker, rather than running an init system and fpm.

NB: I am investigating a Caddy version with fpm, though ... just for the funs.
