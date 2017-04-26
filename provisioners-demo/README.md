# provisioners demo

## Setup

Clean up a bit:

```bash
$ rm -f ./current.date*
$ rm -f ./terraform.tfstate*
```

## Exercise

```bash
$ terraform plan
$ terraform apply
$ ls -la
$ cat current.date.1
```

Now see that no resource will change on another plan:

```bash
$ terraform plan
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

We need to `trigger` the provisioner.

Edit the `version` variable and change it to a `2`.

```bash
$ terraform apply
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
````

_NOTE_ these are only local-exec provisioners so no connection strings required
