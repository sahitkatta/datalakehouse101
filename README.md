**Data Lakehouse Setup with Trino, Dremio, Nessie, and Apache Iceberg**

This repository contains a comprehensive setup for building a modern Data Lakehouse architecture using several key components, including Trino, Dremio, Nessie, MongoDB, and MinIO.

**Table of Contents**

1. [Overview](#overview)
2. [Services](#services)
3. [Getting Started](#getting-started)
4. [Key Features](#key-features)
5. [Future Scope](#future-scope)
6. [Configuration Details](#configuration-details)
7. [References](#references)

---

**Overview**

This project sets up a Data Lakehouse architecture with the following capabilities:

- **Querying**: Utilize Trino and Dremio for SQL-based querying of data in the lakehouse.
- **Version Control**: Employ Nessie for versioned data management.
- **Object Storage**: MinIO serves as the object store for Apache Iceberg tables and metadata.
- **Metadata Storage**: MongoDB acts as a version store for Nessie.

This setup is ideal for exploring and understanding modern data lakehouse concepts such as **data as code**, **versioned data management**, and **cloud-native architecture**.

---

**Services**

The following services are included in the setup:

1. **SQLPad**
   - A lightweight SQL editor for Trino.
   - Accessible at http://localhost:3000 (default username: admin, password: admin123).

2. **Trino**
   - A distributed SQL query engine for big data analytics.
   - Accessible at http://localhost:8080.

3. **Dremio**
   - A high-performance SQL engine for data lakehouses.
   - Accessible at http://localhost:9047.

4. **Nessie**
   - Provides versioned data management for your lakehouse.
   - Accessible at http://localhost:19120.

5. **MongoDB**
   - Acts as the version store for Nessie.
   - MongoDB Express UI is accessible at http://localhost:8081.

6. **MinIO**
   - A high-performance, S3-compatible object storage.
   - Accessible at:
     - MinIO Console: http://localhost:9001
     - MinIO Storage: http://localhost:9000

---

**Getting Started**

**Prerequisites**

- Ensure Docker and Docker Compose are installed on your system.

**Steps**

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Start the services:

   - Ensure Docker is running.
   - Start services using:

     ```bash
     docker-compose up -d
     ```

3. Configure the services:

   - Access SQLPad at http://localhost:3000 and create a Trino connection.
   - Login to MinIO at http://localhost:9001 and create a bucket named `warehouse` (configured in Trino catalogs).
   - Access MongoDB Express at http://localhost:8081 to verify MongoDB setup.
   - Use a Trino client (e.g., JetBrains DataGrip) to view all catalogs.
   - Go to SQLPad and run the SQL scripts from the `scripts/sample.sql` file.

4. Set up a Nessie connection in Dremio:

   - Access Dremio at http://localhost:9047 and create an admin user during the first-time setup.
   - Add a Nessie data source:

     1. Click the **“Add Source”** button.
     2. Select **Nessie**.
     3. Configure the connection:

        - **General Settings:**
          - Name: `nessie`
          - Endpoint URL: `http://nessie:19120/api/v2`
          - Authentication: None
        - **Storage Settings:**
          - Access Key: `admin` (MinIO username)
          - Secret Key: `admin123` (MinIO password)
          - Root Path: `warehouse` (MinIO bucket)
        - **Connection Properties:**
          - `fs.s3a.path.style.access = true`
          - `fs.s3a.endpoint = minio:9000`
          - `dremio.s3.compat = true`
          - Uncheck **“Encrypt Connection”**.

     4. Save the source configuration to connect Nessie to Dremio.

5. Access each service and validate configurations using the provided URLs.
6. Refer to the `screenshots` folder in this repository for visual guidance on setting up and configuring the services.

**Stopping the Services**

To stop the services, run:

```bash
docker-compose down
```

---

**Key Features**

This setup provides the following advanced capabilities:

1. **Branching and Version Control**
   - Create branches for experimental data processing.
   - Manage data changes across environments with isolated branches.

2. **Time Travel and Rollback**
   - Query historical snapshots of data using Nessie and Iceberg.
   - Rollback to a specific snapshot or timestamp in case of errors.

3. **Tagging and Auditing**
   - Tag snapshots to mark key milestones in data workflows.
   - Audit all changes with a detailed history of operations.

4. **Merge and Copy-on-Write Strategies**
   - Utilize **merge** strategies for combining data from branches.
   - Support for copy-on-write techniques for efficient data updates.

5. **Maintenance and Table Compaction**
   - Perform compaction to optimize storage and improve query performance.
   - Periodic cleanup of obsolete data and metadata to reduce storage costs.

6. **Schema Evolution**
   - Modify table schemas dynamically while preserving data integrity.
   - Support for adding, renaming, and removing columns.

7. **Partition Management**
   - Efficiently manage partitions with Iceberg’s advanced partitioning capabilities.
   - Automatic pruning of unnecessary partitions during queries.

8. **Integration with BI Tools**
   - Connect BI tools (e.g., Tableau, Power BI) directly to Dremio or Trino for visualization and reporting.

9. **Cloud-Native Design**
   - S3-compatible object storage via MinIO ensures seamless integration with cloud-based systems.
   - Horizontal scalability with distributed architecture for all services.

---

**Future Scope**

1. **Integration with AWS S3**
   - Transition MinIO to AWS S3 for production-grade object storage and seamless integration with cloud ecosystems.

2. **Singlestore as an Additional Query Engine**
   - Incorporate Singlestore as an additional query engine for enhanced performance and real-time analytics capabilities.

3. **Log-Based Change Data Capture (CDC) Integration**
   - Add support for log-based CDC to enable real-time data ingestion and synchronization across systems.

4. **Infrastructure for Scaling Production Workloads**
   - Design Kubernetes (K8s)-based infrastructure for orchestrating and scaling services to handle production workloads.

5. **Cost Management**
   - Implement monitoring and optimization for infrastructure and storage costs, leveraging tools like Prometheus, Grafana, or cloud-native cost analysis tools.

6. **Kubernetes (K8s) Support**
   - Deploy the entire setup on Kubernetes for robust, scalable, and highly available infrastructure.

---

**References**

- [Experience the Dremio Lakehouse: Hands-on with Dremio, Nessie, Iceberg, Data as Code, and dbt](https://www.dremio.com/blog/experience-the-dremio-lakehouse-hands-on-with-dremio-nessie-iceberg-data-as-code-and-dbt/)
- [Uncover Data Lake Nessie, Dremio, and Iceberg](https://blog.min.io/uncover-data-lake-nessie-dremio-iceberg/)
- [Hands-on with Apache Iceberg, Nessie, Dremio, and Apache Spark](https://www.dremio.com/blog/hands-on-with-apache-iceberg-nessie-dremio-apache-spark/)

