Usage
-----

This is a collection of playbooks to use in the creation of AMIs through Packer, as well as the post-creation configuration of the EC2 instances.

You'll need to install Ansible before you can use this.

Testing
-------

You'll need to specify the SQL user, host and password. In prod it would be something like this:
ansible-playbook -s finalize.yml --extra-vars "aegir_mysql\_host=[amazon RDS DB] aegir\_mysql\_user=[amazon RDS user] aegir\_mysql\_password=[amazon RDS password]"

Depends on block device /dev/xdvh being accessible. This is easier to test in Amazon because the Terraform script will created the volume for you.

Deployment
----------

The only thing you need to run is hub\_full.yml, which will provision the webnodes as well as specified in the hosts file:
    # 1. First run the terraform script
    # 2. Then set Elastic IPs on each of the created instance
    # 3. Edit hosts.test to swap in the Elastic IPs (the test IPs won't work).
    # 4. Run ansible-playbook:
    ansible-playbook -i hosts awforce-ansible/finalize.yml

We'll use the  _packer .yml files to make images with as much stuff installed as possible. We'll use the finalize .yml file on running and new instances.



Developed by Praxis Labs for Advisor Websites.
