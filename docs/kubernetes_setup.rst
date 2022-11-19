*****************
Kubernetes Setup
*****************
This section outlines how to setup the Linode LKE cluster via Terraform code.  All of the steps below will be ran from the ``lke`` directory. 


Linode API Token
----------------
We will need a Linode API token in order for this to work and be able to setup the resources.  You can find a how to located at https://www.linode.com/docs/guides/getting-started-with-the-linode-api/

The scopes you need to give it access to are:

.. parsed-literal::

    Domains - Read/Write
    Kubernetes - Read/Write
    IPs - Read/Write
    Linodes - Read/Write

This API token will become the ``TF_VAR_token`` mentioned in the next section.

Terraform Variables
-------------------
The first thing we need to do is setup some Terraform variables that we are going to be using.

Sensitive Variables
^^^^^^^^^^^^^^^^^^^
There are some variables throughout this setup that are sensitive and you don't want to store in your ``terraform.tfvars`` file, so for these you will do a ``export`` command to set the variables on your own shell.

As mentioned already in the previous step you will want to from your shell run ``export TF_VAR_token=XXX`` which is the Linode API token you already setup in the previous section.

This will be the only required variable that is a secret for the ``lke`` setup, when we setup the domain section next it will require more variables.

The other variables can be found in the ``lke/terraform.tfvars`` file.  These variables below control the cluster label and size of cluster, etc.

Other Variables
^^^^^^^^^^^^^^^
There are a few variables in the ``lke/terraform.tfvars`` file that need to be set in order to ensure your cluster is setup how you want.  This section will outline those variables.

Modify these for your needs.

1. The ``label`` controls what the cluster label will be named.
2. The ``k8s_version`` tells it what version of kubernetes to use.
3. The ``region`` tells what location to build the cluster in.
4. The ``pools`` is a list variable that tells what type of nodes to use and how many.  Currently it is setup to use shared nodes, All node types can be found `Here <https://api.linode.com/v4/linode/types>`_

.. note::
    Currently the pool setting defined configures the following:

    A shared 2GB Linode with 1 vcpu and costs about $10 per node per month for a total cost of $30, plus $10 a month for the load balancer.

Terraform Init & Plan
---------------------
Now that we have our variables all setup and should have Terraform installed now, we can initialize our project and run a plan to verify what it will do.

Make sure you are in the ``lke`` folder and run the following:

``terraform init`` - This will initialize everything needed for the project to run and install modules.

Once this is complete you can now run the plan command to validate you have all your vars setup and it can generate everything properly before applying it:

``terraform plan -var-file="terraform.tfvars"`` which will give a output of the information that it will deploy, validate this looks right before continuing.

Deploy LKE Terraform
--------------------
As long as we didn't have any issues with the previous Init & Plan step we can now deploy our cluster.

Ensuring we still have our ``TF_VAR_token`` exported on our shell then we can run:

``terraform apply -var-file="terraform.tfvars"`` which should ask for a yes prompt and then will deploy the cluster and will generate your kubeconfig to connect to it.

.. note::
    This step can take a few to complete since it has to spin up nodes and set it all up, so be patient.