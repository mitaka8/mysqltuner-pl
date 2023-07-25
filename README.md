# MySQLTuner-Perl Docker

This repository contains a docker container for running [MySQLTuner-Perl](https://github.com/major/MySQLTuner-perl).  Mostly spawned out of a personal need for running this in a Kubernetes Cluster.

## Running in Docker 

```bash
export DB_HOST=localhost
export DB_PASS=password
export DB_USER=root

docker run --rm \
        -e DB_HOST=$DB_HOST \
        -e DB_USER=$DB_USER \
        -e DB_PASS=$DB_PASS \
        mitaka8/mysqltuner-pl
```

## Running in Kubernetes

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: mysql-tuner
  namespace: mariadb
  labels:
    app: mysql-tuner
spec:
  template:
    metadata:
      name: mysql-tuner
      labels:
        app: mysql-tuner
    spec:
      restartPolicy: OnFailure
      containers:
      - name: mysql-tuner
        image: mitaka8/mysqltuner-pl
        env:
        - name: DB_HOST
          value: mariadb.maridb.svc.cluster.local
        - name: DB_USER
          valueFrom:
            secretKeyRef:
              name: credentials
              key: username
        - name: DB_PASS
          valueFrom:
            secretKeyRef:
              name: credentials
              key: password
```
