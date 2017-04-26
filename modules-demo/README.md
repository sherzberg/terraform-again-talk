# modules demo

## Setup

```bash
$ rm -f /tmp/fileoutputer.txt
$ rm -f terraform.tfstate
```

## Exercise

```bash
$ terraform apply
```

You should get an output with this:

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

...

Outputs:

fileoutput = /tmp/fileoutputer.txt

```bash
$ cat /tmp/fileoutputer.txt
12
```

Now lets trigger an update to that file:

```bash
$ terraform apply -var input=9
$ cat /tmp/fileoutputer.txt
18
```
