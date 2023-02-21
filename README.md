# Overview

This is a TeKanAid Academy playground to run Jenkins in a Docker container. Terraform, Vault, and Ansible are also installed in the container so Jenkins can use these for deployments.

Port 8080 is used to view the Jenkins UI. Simply go to the Ports tab and you will see the link to view in the browser.

To get the initial admin password, run the following command:

```bash
sudo cat /var/lib/docker/volumes/jenkins_home/_data/secrets/initialAdminPassword
```

If for some reason, the Jenkins container stops or gets deleted you can restart it with this command:

```bash
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 samgabrail/jenkins-tf-vault-ansible:latest
```