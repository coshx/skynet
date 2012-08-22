Skynet
======

GitHub-aware website builder

Skynet builds and deploys web sites on your VPS or bare metal server. It is triggered by the post-receive hook.

Current Builder Types
---------------------

1. Static. Just copies entire repository to proper location
1. Jekyll. Run jekyll on your repository. Entirely controlled by
   site's `_config.yml`

Usage
-----
* Install Skynet: `$ gem install skynet-deploy`
* Install basic config file: `$ skynet config <first project name>`
* edit config file to add your repositories
* Run builder by hand to ensure everything works: `$ skynet build`
* Start server: `$ skynet server`
