# Wrapper for E-Commerce-Project

# Lokales Deployment der Microservice-Architektur mit Docker Compose

Diese Anleitung beschreibt das Starten der synchronen und asynchronen Systemvarianten mittels Docker Compose.

---

## Voraussetzungen

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Image des Bestellservice in der lokalen Docker Registry](https://github.com/ChFries/bestellservice)
- [Image des Produtkservices in der lokalen Docker Registry](https://github.com/ChFries/produktservice)
- [Image des Paymentservices in der lokalen Docker Registry](https://github.com/ChFries/paymentservice)
- [Image des Versandservices in der lokalen Docker Registry](https://github.com/ChFries/versandservice)



---

## Start der Synchronen Variante (REST)

```bash
docker compose -f docker-compose-rest.yml up -d
```

**Lokal exponierte Ports:**

| Komponente       | Port     |
|------------------|----------|
| Bestellservice   | 8072     |
| Produktservice   | 8074     |
| Paymentservice   | 8073     |
| Versandservice   | 8075     |
| RabbitMQ Mgmt UI | 8071     |
| pgAdmin          | 8070     |

---

## Start der Asynchronen Variante (RabbitMQ)

```bash
docker compose -f docker-compose-rabbit.yml up -d
```

**Lokal exponierte Ports:**

| Komponente       | Port     |
|------------------|----------|
| Bestellservice   | 8172     |
| Produktservice   | 8174     |
| Paymentservice   | 8173     |
| Versandservice   | 8175     |
| RabbitMQ Mgmt UI | 8171     |
| pgAdmin          | 8170     |

---

## Zugriff auf RabbitMQ-Management UI

- URL: [http://localhost:8071](http://localhost:8071) (REST)
- URL: [http://localhost:8171](http://localhost:8171) (RabbitMQ)
- Benutzername: `guest`
- Passwort: `guest`

---

## Zugriff auf pgAdmin

- URL: [http://localhost:8070](http://localhost:8070) (REST)
- URL: [http://localhost:8170](http://localhost:8170) (RabbitMQ)
- Benutzer: `admin@example.com`
- Passwort: `1pw`

---

## Stoppen und Bereinigen

```bash
docker compose -f docker-compose-rest.yml down -v
docker compose -f docker-compose-rabbit.yml down -v
```