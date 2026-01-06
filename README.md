# Cloud SIEM Detection

Cloud-native SIEM for multi-tier application security. Detects web attacks, SQL injection, lateral movement, and data exfiltration using Elastic Stack on AWS infrastructure deployed with Terraform.

---

## Table of Contents
- [Problem](#problem)
- [Solution](#solution)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Results](#results)

---

## Problem

Modern web applications are vulnerable to multi-stage attacks that span across different infrastructure layers. Traditional monitoring approaches create blind spots:

**The Challenge:**
- Web clients, application servers, and databases log events independently
- Security teams can't see the full attack chain when threats move laterally
- By the time a breach is discovered, attackers have already exfiltrated data

**Real-World Attack Scenario:**
```
1. Attacker scans web application for vulnerabilities
2. Exploits SQL injection on frontend
3. Compromises web client
4. Pivots to application server via SSH
5. Moves laterally to database
6. Exfiltrates sensitive data

Without centralized monitoring, each system logs its piece, 
but no one sees the complete picture until it's too late.
```

---

## Solution

A centralized **Security Information and Event Management (SIEM)** system that monitors all application tiers in real-time:

**Key Capabilities:**
- **Unified Visibility**: Single dashboard monitoring client, server, and database layers
- **Real-Time Detection**: Automated alerts for SQL injection, brute force, lateral movement
- **Attack Correlation**: Connects events across systems to identify multi-stage attacks
- **Infrastructure as Code**: Fully automated deployment using Terraform

**How It Works:**
```
Client Logs   ──┐
Server Logs   ──┼──► Elastic Agent ──► SIEM ──► Real-Time Alerts
Database Logs ──┘
```

The SIEM receives logs from all tiers, correlates suspicious activity and generates alerts when attack patterns are detected.

---

## Architecture

![Architecture Diagram](docs/aws_diagram.svg)

### 3-Tier Application Architecture

**Client Tier (Presentation Layer)**
- Nginx serving the web client (static frontend content)
- Public-facing attack surface
- Logs: HTTP requests, SSH attempts, system activity

**Server Tier (Application Layer)**
- Flask/Node.js API handling business logic
- Processes requests from client, queries database
- Logs: API calls, application errors, system activity

**Database Tier (Data Layer)**
- MySQL storing application data
- Most sensitive layer, deepest in network
- Logs: SQL queries, authentication attempts, system activity

**SIEM (Security Monitoring)**
- Monitors all three tiers simultaneously
- Correlates events to detect attack chains
- Provides real-time alerts and investigation capabilities

---

## Technology Stack

**Security & Monitoring**
- Elastic Stack 8.11.0 (Elasticsearch, Kibana, Elastic Agent)
- Custom detection rules mapped to MITRE ATT&CK

**Cloud Infrastructure**
- AWS (EC2, VPC, Security Groups, NAT Gateway)
- 4 EC2 instances: 1x t3.medium (SIEM), 3x t2.micro (app tiers)

**Infrastructure as Code**
- Terraform for automated deployment
- User data scripts for instance bootstrapping

**Application Stack**
- Nginx (web client/frontend server)
- Python Flask / Node.js (application server)
- MySQL (database with query logging)

---

## Results

🎥 **[YouTube Demo Video]** - Coming soon

*This section will include:*
- Detection examples with real attack scenarios
- Kibana dashboard screenshots
- Attack timeline visualizations
- Performance metrics

---

## Repository Structure

```
cloud-siem-detection/
├── terraform/              # Infrastructure as Code
├── detection-rules/        # SIEM detection logic
├── attack-simulations/     # Testing scripts
├── playbooks/              # Incident response procedures
└── docs/                   # Documentation
```

---

## Contact

Questions? Open an issue or reach out for the YouTube video link.