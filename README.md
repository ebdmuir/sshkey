# SSH Key module for terraform

Sometimes you just need a new ssh key to authenticate with your servers, add this little module and have it synced with ec2 to be ready to go with your instances

```
module "sshkey" {
	source  = "app.terraform.io/ebdm/sshkey/aws"
	version = "0.1.0"
	
	name = "myapp"
	save = true ? false // Should it be saved to disk?
},
```

You'll then get 2 outputs, privkey and pubkey, they should be rather self explanitory