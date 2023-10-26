### This is how you do first-time setup on AutoServ device(s)
##### from Jared's memory - might be slightly wrong


1. create "deployer" user on autoserv
2. ssh-keygen as deployer
3. put public SSH key into this repo / read-only access
4. add "deploy.sh" script to this repo with commands to be run, and any other logic, file copies, etc
5. setup root crontab to pull code from this github repo, and to execute deploy.sh, on a regular schedule.
