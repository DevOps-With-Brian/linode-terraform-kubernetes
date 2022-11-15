# Linode Terraform
This repo consists of a few folders that setup different things in linode.  The `lke` folder is for setting up kubernetes and after that is setup the `dns` folder can be used to setup the linode domain/dns config for the ingress.

The general steps is to go to the `lke` folder first and follow the instructions to setup the kubernetes cluster and ingress.

After that go to the `dns` folder and set that up if you want a custom domain and public dns options for getting to your public apps off kubernetes.

Finally you go to the `cert-manager` folder to setup the cert manager for Let's Encrypt ssl certs setup and encrypting your public pods.

The `rasa` dir is an example helm setup with a values file for deploying our Rasa chatbot onto the cluster and being able to talk to it over SSL.