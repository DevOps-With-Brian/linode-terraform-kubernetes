# Linode Terraform
[![version](https://img.shields.io/badge/version-0.0.2-blue)](https://github.com/DevOps-With-Brian/linode-terraform-kubernetes/blob/main/CHANGELOG.md)

This not only is meant to be used as a guide to help others but also is my production terraform code for [DevOps With Brian](www.devopswithbrian.com) where I have a blog and a few other things used in [Youtube Videos](https://www.youtube.com/@devopswithbrian)

If using custom dns and setting up a domain then you will want on your domain registrar/current dns for it update it to use custom nameservers:

```
ns1.linode.com
ns2.linode.com
ns3.linode.com
ns4.linode.com
ns5.linode.com
```

This will then allow linode to control the dns, I am doing that in this repo since this hosts all my stuff under my domain and I want to have ssl setup on my kubernetes apps.

## How To Use
This repo consists of a few folders that setup different things in linode.  The `lke` folder is for setting up kubernetes and after that is setup the `dns` folder can be used to setup the linode domain/dns config for the ingress.  Each folder has a README with instructions on what to do.

The general steps is to go to the `lke` folder first and follow the instructions to setup the kubernetes cluster and ingress.

After that go to the `dns` folder and set that up if you want a custom domain and public dns options for getting to your public apps off kubernetes.

Finally you go to the `cert-manager` folder to setup the cert manager for Let's Encrypt ssl certs setup and encrypting your public pods.

The `rasa` dir is an example helm setup with a values file for deploying our Rasa chatbot onto the cluster and being able to talk to it over SSL.
