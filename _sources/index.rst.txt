.. Banjo Documentation master file, created by
   sphinx-quickstart on Tue Sep 20 11:14:47 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the Banjo Documentation!
===============================================

Banjo is a wrapper for Django. It provides a simplified subset of Django's functionality.

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   models
   views
   .. example




Set Up 
---------

To install Banjo:
``pip3 install django-banjo``

To write a Banjo app, create this file structure:

- ``/app``
   - ``models.py``
   - ``views.py``


Banjo Server
------------

To run a Banjo server: ``banjo``

To run a Banjo server in debug mode: ``banjo --debug``

To run a Banjo server on a specific port: ``banjo --p 8001``


Banjo Shell
------------

To enter the Banjo shell: ``banjo --shell``

