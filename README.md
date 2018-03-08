# upload-tar-shell
A shell tool for uploading directory as a tar file to server.

## Prepare

### Modify the lines as your config.

```
USER_SERVER="root@yourserver"
UPLOAD_DIRECTORY="/local/path/to/the/folder"
SERVER_DIRECTORY="/backup/path/on/the/server"
```
such as

```
USER_SERVER="root@aaa.me"
UPLOAD_DIRECTORY="/usr/uploaddir"
SERVER_DIRECTORY="/root/backup"
```

### Set running permission of the bash.

`chmod +x ./upload-tar.sh`

### Config the PublicKey.

1. Make sure you have your own public key.
1. Get your local public key by `more ~/.ssh/id_rsa.pub`.
1. Add it to the tail of the file `~/.ssh/authorized_keys` on your server.

----

## Usage

### Upload the folder

```
./upload-tar.sh
```

It will tar the UPLOAD_DIRECTORY as a tar.gz file and upload to the server.

### Clean remote packages

```
./upload-tar.sh clean
```

Clean the directory on the server. It will remove the packages uploaded before the current date.

