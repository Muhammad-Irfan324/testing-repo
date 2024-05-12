# Question - 4

```
Write scripts in Python or Bash to
automate database backups for PostgreSQL and MySQL, and ensure these
scripts handle encryption of the backup files. Additionally, create a script to
automate the scaling of Kubernetes pods based on CPU and memory usage
thresholds.
```

# Python Script for PostgreSQL Backup and Encryption

```
import subprocess
import datetime
import os

PG_HOST = 'localhost'
PG_PORT = '5432'
PG_USER = 'your_username'
PG_PASSWORD = 'your_password'
PG_DATABASE = 'your_database'

BACKUP_DIR = '/path/to/backup/directory/'

ENCRYPTION_KEY = 'your_encryption_key'

backup_file = os.path.join(BACKUP_DIR, f'backup_{datetime.datetime.now().strftime("%Y%m%d%H%M%S")}.sql')

pg_dump_command = f'pg_dump -h {PG_HOST} -p {PG_PORT} -U {PG_USER} -d {PG_DATABASE} > {backup_file}'
subprocess.run(pg_dump_command, shell=True)

encrypt_command = f'openssl enc -aes-256-cbc -salt -in {backup_file} -out {backup_file}.enc -k {ENCRYPTION_KEY}'
subprocess.run(encrypt_command, shell=True)

os.remove(backup_file)
```

# Bash Script for MySQL Backup Backup and Encryption

```
#!/bin/bash

MYSQL_USER="your_username"
MYSQL_PASSWORD="your_password"
MYSQL_DATABASE="your_database"

BACKUP_DIR="/path/to/backup/directory/"

ENCRYPTION_KEY="your_encryption_key"

backup_file="$BACKUP_DIR/backup_$(date +%Y%m%d%H%M%S).sql"

mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $backup_file

openssl enc -aes-256-cbc -salt -in $backup_file -out $backup_file.enc -k $ENCRYPTION_KEY

rm $backup_file
```

- Scaling Pods using [HPA](https://github.com/Muhammad-Irfan324/testing-repo/blob/kube-manifest/hpa.yaml)
- kubect get HPA command
![HPA](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-4/Selection_371.png)
- on Putting load
![Load1](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-4/Selection_372.png)
![Load2](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-4/Selection_373.png)  
