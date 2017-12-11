#### How to use dockerfiles:

1. You need complete docker installation with docker-compose
2. Run docker-compose with corresponding syntax:
`docker-compose -f docker-compose.<service>.yml up -d`

#### Run all services with Make:

`make deploy` - Run all services with Make

`make clean` - Remove all services

Passwords for services:

1. SonarQube: admin/admin
2. Nexus: admin/admin123
3. Jenkins: admin /var/jenkins_home/secrets/initialAdminPassword