## vLocalstack

Summary : 

Original Repo : https://github.com/localstack/localstack

Machine Configuration [minimum]
=======================================================
 - Hypervisor: VirtualBox
 - Processor: 1 CPU
 - Ram: 1 GB
 - OS Image: ubuntu-20.04.1-desktop-amd64.iso
 - Network: Reachable to internet

Run the scripts using commands of format : $ bash <file-name>.sh

Issue : Cannot set alias using shell script.
 - So please manually use :
 - alias AWS="aws --endpoint-url http://localhost:4566"
This allows user to use aws-cli commands using AWS instead of aws.

## Steps involved

If there is no folder "vLocalstack/setup/src/zip/pkg.zip" use commands
```
cd vLocalstack/setup/src/zip/
bash zip.sh
```

To set-up the environment use commands
```
cd vLocalstack/setup/
bash setup.sh
```

After set-up is complete, to run localstack use commands
```
cd vLocalstack/
bash start.sh
```

When working with localstack is complete
use Ctrl+C to stop the process inside docker.

After that to cleanup use the command
```
bash cleanup.sh
```
