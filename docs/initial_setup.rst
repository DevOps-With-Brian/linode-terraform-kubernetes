Linode Terraform - Initial Setup
================================================================
This documentation section goes over the initial setup of everything required to setup a `Linode <https://linode.com/>`_ LKE cluster as code via `Terraform <https://www.terraform.io/>`_.  This currently sets up the following after complete:

| Linode LKE - Kubernetes Cluster with 3 shared nodes
| Linode node_balancer - Using nginx ingress it will use this to allow for public resources if wanted from kubernetes.
| Linode Domain - Sets up your own domain in linode to be used for dns resolution in kubernetes as well as for a githubpages if desired.

This also sets up cert-manager in kubernetes and allows for auto cert generation using Let's Encrypt using annocations on our deployments.




Setup Pre-Req's
---------------
For the entire project the way I am using it you will need your own domain, otherwise you can skip the ingress ssl and domain parts and only use the LKE Terraform.

Once you setup your own domain you are going to want to point it to the Linode nameservers:

.. parsed-literal::

    ns1.linode.com
    ns2.linode.com
    ns3.linode.com
    ns4.linode.com
    ns5.linode.com
