
**Data Lakehouse Setup with Trino, Dremio, Nessie, and Apache Iceberg**

  

This repository contains a comprehensive setup for building a modern Data Lakehouse architecture using several key components, including Trino, Dremio, Nessie, MongoDB, and MinIO.

  

**Table of Contents**

1. [Overview](#overview)

2. [Services](#services)

3. [Getting Started](#getting-started)

4. [Configuration Details](#configuration-details)

5. [References](#references)

  

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

• Accessible at http://localhost:3000 (default username: admin, password: admin123).

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

• Ensure Docker and Docker Compose are installed on your system.

  

**Steps**

1. Clone this repository:

  

git clone <repository-url>

cd <repository-directory>

  

  

2. Start the services:

• Ensure Docker is running.

• Start services using:

  

docker-compose up -d

  

  

3. Configure the services:

• Access SQLPad at http://localhost:3000 and create a Trino connection.

• Login to MinIO at http://localhost:9001 and create a bucket named warehouse (configured in Trino catalogs).

• Access MongoDB Express at http://localhost:8081 to verify MongoDB setup.

• Use a Trino client (e.g., JetBrains DataGrip) to view all catalogs.

• Go to SQLPad and run the SQL scripts from the scripts/sample.sql file.

4. Set up a Nessie connection in Dremio:

• Access Dremio at http://localhost:9047 and create an admin user during the first-time setup.

• Add a Nessie data source:

1. Click the “Add Source” button.

2. Select **Nessie**.

3. Configure the connection:

• **General Settings:**

• Name: nessie

• Endpoint URL: http://nessie:19120/api/v2

• Authentication: None

• **Storage Settings:**

• Access Key: admin (MinIO username)

• Secret Key: admin123 (MinIO password)

• Root Path: warehouse (MinIO bucket)

• **Connection Properties:**

• fs.s3a.path.style.access = true

• fs.s3a.endpoint = minio:9000

• dremio.s3.compat = true

• Uncheck “Encrypt Connection”.

4. Save the source configuration to connect Nessie to Dremio.

5. Access each service and validate configurations using the provided URLs.

6. Refer to the screenshots folder in this repository for visual guidance on setting up and configuring the services.

  

**Stopping the Services**

  

To stop the services, run:

  

docker-compose down

  

**References**

• [Experience the Dremio Lakehouse: Hands-on with Dremio, Nessie, Iceberg, Data as Code, and dbt](https://www.dremio.com/blog/experience-the-dremio-lakehouse-hands-on-with-dremio-nessie-iceberg-data-as-code-and-dbt/)

• [Uncover Data Lake Nessie, Dremio, and Iceberg](https://blog.min.io/uncover-data-lake-nessie-dremio-iceberg/)

• [Hands-on with Apache Iceberg, Nessie, Dremio, and Apache Spark](https://www.dremio.com/blog/hands-on-with-apache-iceberg-nessie-dremio-apache-spark/)
