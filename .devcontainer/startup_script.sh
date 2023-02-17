#!/usr/bin/bash
docker build -t jenkins_container ./.devcontainer
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins_container