# Blog creator API

## Contents
- [How to setup?](#how-to-setup)
- [API Documentation](#api-documentation)
- [Links](#links)

### How to setup?

- Firstly you have to add requires [environment variables](https://github.com/blog-creator-team/blog_creator_api/blob/master/.env.example) into your .env
- Prepare app dependencies and up project.

docker-compose:

```bash
# Build images
docker-compose build

# Create database
docker-compose run --rm web rails db:create

# Run database migrations
docker-compose run --rm web rails db:mirgate

# Add test records into database (optional)
docker-compose run --rm web rails db:seed

# Run application
docker-compose up

```

## API Documentation

Swagger documentation: `/api/docs`

App using [CaddyServer](https://caddyserver.com) for proxying and encapsulating
app resources.
 
Any request, except following, will proxy to `CDN_URL/blogs` 
- `/api/*` - Rails app
- `/events/*` - ActiveCable connection
- `/assets/*` - Rails app assets. Will proxy to local (in development) or S3 (in production)
- `/images/*` - Uploaded images. Will proxy to local (in development) or S3 (in production)

Example of API request: `http://localhost/api/v1/posts`

## Links

- [Front-End](https://github.com/blog-creator-team/blog-creator)
