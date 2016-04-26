Usage
-----

This is a collection of playbooks to use in the creation of AMIs through Packer, as well as the post-creation configuration of the EC2 instances.

You'll need to install Ansible before you can use this.

Testing
-------

To test the configuration in Vagrant, you'll need to specify the SQL user, host and password. In prod it would be something like this:
ansible-playbook -s [whichever]_full.yml --extra-vars "aegir_mysql\_host=[amazon RDS DB] aegir\_mysql\_user=[amazon RDS user] aegir\_mysql\_password=[amazon RDS password]"

Deployment
----------

Always run the webnode\_full before running hub\_full, as hub\_full won't configure the nodes, it only includes them so it can aggregate their credentials (for the reverse proxy).

We'll use the  _packer .yml files to make images with as much stuff installed as possible. We'll use the _full .yml files on running and new instances.



Developped by Praxis Labs for Advisor Websites.
