# Script zum Aufbauen für lokale Testumgebung bei nicht-dockerisierter lokaler Ausführung der Services z.B. über mvn clean spring-boot:run oder aus IDE
docker run --name postgresql-development -p 5433:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=1pw -d postgres:15
docker run --name rabbit-management-development -p 8074:15672 -p 5672:5672 -d rabbitmq:4.1.2-management
docker run --name pgadmin-development -p 8080:80 -e PGADMIN_DEFAULT_EMAIL=admin@example.com -e PGADMIN_DEFAULT_PASSWORD=1pw -d dpage/pgadmin4:latest