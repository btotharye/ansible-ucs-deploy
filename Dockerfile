# Latest version of centos
FROM centos:centos7
MAINTAINER Brian Hopkins <brianhh1230@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip

RUN mkdir /opt/ansible/
RUN git clone git://github.com/ansible/ansible.git --recursive /opt/ansible/ansible
RUN pip install paramiko PyYAML Jinja2 httplib2 six ucsmsdk ucsm_apis
WORKDIR /opt/ansible/ansible
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib:/opt/ansible-ucs
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library:/opt/ansible-ucs/library
RUN source ./hacking/env-setup
RUN mkdir /opt/ansible-ucs
WORKDIR /opt/ansible-ucs
