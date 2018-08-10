.PHONY: deploy clean

deploy:
	${INFO} "Creating Jenkins..."
	@ docker-compose -f docker-compose.jenkins.yml up -d --build
	${INFO} "Creating Nexus..."
	@ docker-compose -f docker-compose.nexus.yml up -d --build
	${INFO} "Creating SonarQube..."
	@ docker-compose -f docker-compose.sonar.yml up -d --build
	${INFO} "Build complete"
	${INFO} "Browse to localhost:8080 for Jenkins"
	${INFO} "Browse to localhost:8081 for Nexus"
	${INFO} "Browse to localhost:9000 for Sonar"

clean:
	${INFO} "Deleting Jenkins..."
	@ docker-compose -f docker-compose.jenkins.yml down -v --remove-orphans
	${INFO} "Deleting Nexus..."
	@ docker-compose -f docker-compose.nexus.yml down -v --remove-orphans
	${INFO} "Deleting SonarQube..."
	@ docker-compose -f docker-compose.sonar.yml down -v --remove-orphans
	${INFO} "Cleanup complete"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
