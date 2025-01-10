
**Data Lakehouse Setup with Trino, Dremio, Nessie, and Apache Iceberg**

  

This repository contains a comprehensive setup for building a modern Data Lakehouse architecture using several key components, including Trino, Dremio, Nessie, MongoDB, and MinIO.

  

**Table of Contents**

1. [Overview](#overview)

2. [Services](#services)

3. [Getting Started](#getting-started)

4. [References](#references)

  

**Overview**

  

This project sets up a Data Lakehouse architecture with the following capabilities:

• **Querying**: Utilize Trino and Dremio for SQL-based querying of data in the lakehouse.

• **Version Control**: Employ Nessie for versioned data management.

• **Object Storage**: MinIO serves as the object store for Apache Iceberg tables and metadata.

• **Metadata Storage**: MongoDB acts as a version store for Nessie.

  

This setup is ideal for exploring and understanding modern data lakehouse concepts such as **data as code**, **versioned data management**, and **cloud-native architecture**.

  

**Services**

  

The following services are included in the setup:

1. **SQLPad**

• A lightweight SQL editor for Trino.

• Accessible at http://localhost:3000 (default username: admin, password: admin).

2. **Trino**

• A distributed SQL query engine for big data analytics.

• Accessible at http://localhost:8080.

3. **Dremio**

• A high-performance SQL engine for data lakehouses.

• Accessible at http://localhost:9047.

4. **Nessie**

• Provides versioned data management for your lakehouse.

• Accessible at http://localhost:19120.

5. **MongoDB**

• Acts as the version store for Nessie.

• MongoDB Express UI is accessible at http://localhost:8081.

6. **MinIO**

• A high-performance, S3-compatible object storage.

• Accessible at:

• MinIO Console: http://localhost:9001

• MinIO Storage: http://localhost:9000

  

**Getting Started**

  

**Prerequisites**

• Docker and Docker Compose installed on your system.

  

**Steps**

1. Clone this repository:

  

git clone <repository-url>

cd <repository-directory>

  

  

2. Start the services:

  

docker-compose up -d

  

  

3. Access each service using the URLs mentioned in the **Services** section.

4. Configure your tools (e.g., Trino catalogs, Nessie repositories) as needed for your data environment.

  

**Stopping the Services**

  

To stop the services, run:

  

docker-compose down

  

**References**

• [Experience the Dremio Lakehouse: Hands-on with Dremio, Nessie, Iceberg, Data as Code, and dbt](https://www.dremio.com/blog/experience-the-dremio-lakehouse-hands-on-with-dremio-nessie-iceberg-data-as-code-and-dbt/)

• [Uncover Data Lake Nessie, Dremio, and Iceberg](https://blog.min.io/uncover-data-lake-nessie-dremio-iceberg/)

• [Hands-on with Apache Iceberg, Nessie, Dremio, and Apache Spark](https://www.dremio.com/blog/hands-on-with-apache-iceberg-nessie-dremio-apache-spark/)

