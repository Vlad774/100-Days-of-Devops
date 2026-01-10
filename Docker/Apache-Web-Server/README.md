# 🕸️ Apache Web Server (HTTPD)

## 📄 Task Description
The goal is to deploy a static website using the Apache HTTP Server (`httpd`) on a containerized environment.

### Requirements:
1.  **Host:** App Server 2
2.  **Container Name:** `httpd`
3.  **Image:** `httpd:latest`
4.  **Port Mapping:** Host Port `3000` ➡️ Container Port `80`
5.  **Volume Mapping:** Host `/opt/data` ➡️ Container `/usr/local/apache2/htdocs`

---

## 🏗️ Architecture Diagram

```mermaid
graph LR
    subgraph Host_Server [App Server 2]
        HostPort[":3000"]
        HostVol[("/opt/data")]
    end

    subgraph Docker_Container [Container: httpd]
        ContainerPort[":80"]
        ContainerVol[("/usr/local/apache2/htdocs")]
    end

    User((User)) -->|Browser Request| HostPort
    HostPort -->|Forward| ContainerPort
    HostVol -.->|Mount| ContainerVol

    style Host_Server fill:#f9f,stroke:#333,stroke-width:2px
    style Docker_Container fill:#ccf,stroke:#333,stroke-width:2px    