```
sonarqube:

sysctl -w vm.max_map_count=262144

vim /etc/sysctl.conf

echo "vm.max_map_count=262144" >> /etc/sysctl.conf


CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;


CREATE DATABASE sonar;
CREATE USER sonar WITH ENCRYPTED PASSWORD 'sonar';
GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;


admin
adminPwd_Sonar
```



```
Jenkins:

sudo chown -R 1000:1000 docker_data/jenkins

/var/jenkins_home/secrets/initialAdminPassword
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

admin
adminPwd_Jenkins

sudo usermod -a -G groupname username

sudo usermod -a -G docker 1000

```
