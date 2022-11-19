*****************
Kubernetes Setup
*****************
This section outlines how to setup the Linode LKE cluster via Terraform code.  All of the steps below will be ran from the *lke* directory. 


Linode API Token
----------------
We will need a Linode API token in order for this to work and be able to setup the resources.  You can find a how to located at https://www.linode.com/docs/guides/getting-started-with-the-linode-api/

The scopes you need to give it access to are:

.. parsed-literal::

    Domains - Read/Write
    Kubernetes - Read/Write
    IPs - Read/Write
    Linodes - Read/Write

Terraform Variables
-------------------
The first thing we need to do is setup some Terraform variables that we are going to be using.

