# ISDB-small-company-db-project


This repository showcases the design and implementation of a **relational database system** for a veterinary hospital, developed for the **Information Systems and Databases Course** @ Instituto Superior Técnico.

## 📦 Project Overview

The project involves building a database system that models real-world entities and operations in a veterinary hospital setting, from animal ownership to medical procedures and diagnostics.

### 🔧 Main Deliverables
- 📄 Entity-Relationship (ER) Model
- 🛠 Relational Schema and SQL Implementation (PostgreSQL)
- 💾 Data Insertion Scripts
- 📊 Test Queries and Results
- 🖼 ER Diagram Visuals and Presentation Slides

---

## 🧠 Key Features

- Weak Entities: `animal`, `visit`, `weight`
- Specializations: `mammal → dog / cat / other`, `procedure → test / radiography / surgery`
- Mandatory and Disjoint Constraints
- Complete relational translation with `CREATE TABLE` + foreign keys
- Prescriptions, diagnostics, test indicators, and assistants included

---

## 🚀 Environment Setup

This repository provides containerized services using **Docker Compose** to simplify the setup of all required tools and services for development and testing.

### 🧰 Services Included

| Service     | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| PostgreSQL  | Open-source relational database management system                           |
| pgAdmin4    | GUI for PostgreSQL administration and query execution                       |
| bdist/notebook | Jupyter Notebook Databases Stack (interactive DB notebooks with Python) |

### 🐳 Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## ⚙️ Running the Environment

1. Clone this repository:
```bash
git clone https://github.com/your-username/isdb-vetdb-project.git
cd bdist-workspace
```

## Project Structure

├── Assignment/               # Original problem description

├── ER_Model/                 # ER diagram images and source (draw.io)

├── SQL/                      # SQL schema creation and insert scripts

│   ├── create_schema.sql

│   ├── test_data.sql

│   └── test_queries.sql

├── Presentation/             # Slides for explanation

├── Documentation/            # Design decisions and notes

└── README.md                 # This file


---

## How to Use
- Execute create_schema.sql to generate the database schema.

- Run test_data.sql to populate initial data (clients, animals, visits).

- Use test_queries.sql to validate schema behavior and relationships.

- Explore/extend via pgAdmin or Jupyter.

## Learning Outcomes

- Transforming business requirements into a relational model

- Applying ER modeling principles (weak entities, specializations, keys, constraints)

- Writing and organizing complex SQL

- Managing DB environments using containers

## Acknowledgments

Developed as part of the Information Systems and Databases course
Instituto Superior Técnico, University of Lisbon
