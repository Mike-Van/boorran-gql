# Boorran GQL
This is the repo containing all the migrations file for deploying to a hasura instance hosted at [https://hasura.boorran.com](https://hasura.boorran.com).

Use admin secret  `Boorran168` to access the console or running from local development environment.

To run this repo locally:
```
hasura console --admin-secret <ADMIN_SECRET_HERE>
```

To sync migration to remote instance:
```
hasura migrate apply --endpoint <ENDPOINT_HERE> --admin-secret <ADMIN_SECRET_HERE>
```

Reference docs for CLIs:

 - [console](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/hasura_console.html)
- [migrate](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/hasura_migrate_create.html)
