# 🚀 Steps to Run Docker in the Microservice Architecture

## 🧩 Steps for Product Service

---

### **1️⃣ Build the Docker Image**

Run the build command inside your API project directory:

```bash
docker build -t ecom-service:1.0 -f ./ProductsMicroService.API/Dockerfile .
```

**Explanation:**
- `-t` → Tag for the image (e.g., `ecom-service:1.0`)
- `-f` → Path to the Dockerfile (if not in the current directory)
- `.` → Current directory as the build context

---

### **2️⃣ Run the Built Image (Port Mapping)**

Run the image locally and expose necessary ports:

```bash
docker run -p 8080:8080 -p 8081:8081 ecom-service:1.0
```

---

### **3️⃣ Push the Docker Image to Docker Hub**

First, tag your image with your Docker Hub username and version tag:

```bash
docker tag ecom-service:1.0 devnishant063/ecom-service:v1.0
```

Then push it:

```bash
docker push devnishant063/ecom-service:v1.0
```

---

### **4️⃣ Create a Docker Network for Communication**

Create a shared network so multiple containers (e.g., API + DB) can communicate:

```bash
docker network create productsmicroservice-network
```

Verify network creation:

```bash
docker network ls
```

Inspect network details and check connected containers:

```bash
docker network inspect <networkId>
```

---

### **5️⃣ Run the MySQL Container**

Run MySQL with environment variables, network, and initialization script:

```bash
docker run -it \
  -e MYSQL_ROOT_PASSWORD=admin \
  -p 3306:3306 \
  --hostname=mysql-host-productmicroservice \
  --network=productsmicroservice-network \
  -v "$(pwd)/basescript.sql:/docker-entrypoint-initdb.d/basescript.sql" \
  mysql:latest
```

**Explanation:**
- `MYSQL_ROOT_PASSWORD` → Sets root password for MySQL
- `--network` → Connects to the same network as microservices
- `-v` → Mounts the initialization script into the container
- MySQL automatically executes the `.sql` file on startup

---

### **6️⃣ Connect the Microservice to the Network**

Run your microservice container and connect it to the MySQL container:

```bash
docker run -p 8080:8080 \
  --network=productsmicroservice-network \
  -e MYSQL_HOST=mysql-host-productmicroservice \
  -e MYSQL_PASSWORD=admin \
  devnishant063/ecom-service:v1.0
```

---

### **7️⃣ (Optional) Add Environment Variables & Volume Setup**

You can define environment variables in your `Dockerfile` or `docker-compose.yml` for better configuration:

Example `Dockerfile` snippet:
```dockerfile
ENV MYSQL_HOST=mysql-host-productmicroservice
ENV MYSQL_PASSWORD=admin
```

---
