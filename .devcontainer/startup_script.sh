#!/usr/bin/bash
docker build -t jenkins_container .
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins_container
echo 'Go to the Ports tab where you will find the link to access the Jenkins UI on port 8080 \n Here is your Initial Admin Password to access Jenkins: \n' && sudo cat /var/lib/docker/volumes/jenkins_home/_data/secrets/initialAdminPassword