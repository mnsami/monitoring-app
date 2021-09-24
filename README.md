# Monitoring App

This is an monitoring mocking app to demonstrate the following:

1. Create a Symfony back-end API.
2. Create a SPA ReactJS connected to the Symfony back-end api with hot reloading.
3. Use `docker` and `docker-compose` to manage the development.

I have developed this app part of a blog series tutorial on how to build a painless and worry free full stack environment agnostic development environment to help on-board your development teams faster and quicker. And enable them to focus more on actual features development rather than the hassle of maintaining their development environment.

- [Part 1: Setup a dockerized Symfony backend app with ReactJs for frontend with hotloading enabled](https://www.minasami.com/2021/06/23/part-1-setup-reactjs-symfony-app-with-hotloading.html)
- [Part 2: Setup a SPA reactjs frontend with hot reloading for development](https://www.minasami.com/2021/09/24/part-2-setup-spa-reactjs-frontend-with-hot-reloading-for-development.html)

## Requirements

1. Docker

## Installation

- run `make container-up`

## Running

- You can access the mocked health check endpoint via `http://localhost:90/api/v1/healthCheck`
- You can access the frontend to display the server health check via `http://localhost:3000`
