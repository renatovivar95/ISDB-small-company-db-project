# ISDB-small-company-db-project


This repository showcases the design and implementation of a **relational database system** for a veterinary hospital, developed for the **Information Systems and Databases Course** @ Instituto Superior Técnico.

## Project Overview

The project involves building a database system that models real-world entities and operations in a veterinary hospital setting, from animal ownership to medical procedures and diagnostics.

---

## Key Features

- Weak Entities: `animal`, `visit`, `weight`
- Specializations: `mammal → dog / cat / other`, `procedure → test / radiography / surgery`
- Mandatory and Disjoint Constraints
- Complete relational translation with `CREATE TABLE` + foreign keys
- Prescriptions, diagnostics, test indicators, and assistants included

---

## Environment Setup

This repository provides containerized services using **Docker Compose** to simplify the setup of all required tools and services for development and testing.

### Services Included

| Service     | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| PostgreSQL  | Open-source relational database management system                           |
| pgAdmin4    | GUI for PostgreSQL administration and query execution                       |
| bdist/notebook | Jupyter Notebook Databases Stack (interactive DB notebooks with Python) |

### 🐳 Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Clone the official ISDB workspace environment

---

## ⚙️ Running the Environment

1. Clone the workspace environment repository provided by the course and follow the instructions given there.

```bash

git clone https://github.com/bdist/bdist-workspace.git
```

2. Use the jupyter notebook file in Documentation Folder.


## Project Structure

├── Assignment/               # Original problem description

├── ER_Model/                 # ER diagram image

├── SQL/                      # SQL schema creation and insert scripts

│   ├── CREATE-ASSOCIATIONS.sql

│   ├── CREATE-ENTITIES.sql

│   ├── TOOL-DROP-TABLES-1.sql

│   ├── TOOL-DROP-TABLES-2.sql

│   ├── TESTING-INSERT-RANDOM-DATA.sql

│   └── TESTING-QUERIES.sql

├── Documentation/            # Report and Presentation

│   ├── Presentation.sql

│   ├── report.ipynb

│   └── report.sql

└── README.md                 # This file


---


## Learning Outcomes

- Transforming business requirements into a relational model

- Applying ER modeling principles (weak entities, specializations, keys, constraints)

- Writing and organizing complex SQL

- Managing DB environments using containers

## Acknowledgments

Developed as part of the Information Systems and Databases course Instituto Superior Técnico, University of Lisbon