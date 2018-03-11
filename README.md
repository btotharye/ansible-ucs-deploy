# ansible-ucs-deploy
A docker setup for deploying UCSM setups using playbooks on a local machine

# How To Use

## Build The Image
1. Clone this repo - `git clone https://github.com/btotharye/ansible-ucs-deploy.git`
2. CD to the newly created folder - `cd ansible-ucs-deploy`
3. Build the image - `docker build -t ansible-ucs .`

## Using The Image
From either your own folder containing your ucs ansible playbook setup or you can clone my version at https://github.com/btotharye/ansible-ucs then you run the following command to run your site.yml configuration file that is in your local directory, this will map your current folder into the container and run it:

Using my repo example:
`docker run -it -v /path/ucsm-ansible:/opt/ansible-ucs ansible-ucs ansible-playbook -i inventory site.yml`

This will run the docker image and map in the /path/ucsm-ansible files into the container then run ansible-playbook -i inventory site.yml in the container to trigger our automation.  You can modify your files locally first and then run this above command to trigger it without having to have ansible installed on your local machine.
