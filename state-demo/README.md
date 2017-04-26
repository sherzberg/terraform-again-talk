# state demo

## Setup

Clear out all state information:

```bash
$ rm -f terraform.tfstate*
$ rm -f graph.png
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

We can also view the graph:

```bash
$ terraform graph
$ terraform graph | dot -Tpng > graph.png
```

Open up the `graph.png`
