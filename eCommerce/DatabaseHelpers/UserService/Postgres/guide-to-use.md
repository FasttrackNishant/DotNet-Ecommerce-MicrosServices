# Postgres DB

# First Docker Compose UP the Postgres

## Enter into Container

    1. Directly from Docker CLI
   
    - docker exec -it postgres-container psql -U admin -d eCommerceUsers 


    2.Login as postgres superuser
    docker exec -it postgres-container psql -U postgres



    - \dt -> to list table to check