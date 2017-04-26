# state demo

## Setup

Clear out all state information:

```bash
$ rm -f terraform.tfstate*
```

## Exersize

```bash
$ ls -la
$ terraform plan
$ terraform apply
$ ls -la
$ cat terraform.tfstate
```

The statefile now exists and the `data.template_file.my_template` exists.
