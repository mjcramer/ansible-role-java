Java Ansible Role
=================
[![Build Status](https://travis-ci.org/mjcramer/ansible-role-java.svg?branch=master)](https://travis-ci.org/mjcramer/ansible-role-java) [![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-mjcramer.java-blue.svg)](https://galaxy.ansible.com/mjcramer/java/) 

An ansible role for installing java

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

- google-auth
- pyOpenSSL
- dopy

Role Variables
--------------

Currently, the oracle and openjdk JVMs are supported. 

| Name | Value |
| --- | --- |
| jvm_provider | - openjdk | 
| | - oracle |
| java_version | - 8 |
| | - 11 |


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Tags
----
- require
- download
- apply
- configure
- initialize
- check


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: mjcramer.java, java_version: 8 }

License
-------

Unlicensed

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
