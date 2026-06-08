#########################################

## Issue encountered in Staging

**Symptom:** All pods remained stuck in *Pending* state and never started.  
**Cause:** Disk usage reached **73%**, which automatically triggered the Kubernetes taint:
This taint prevented new pods from being scheduled on the node.  
**Proof:**  Screenshots are available in the `images/` folder.   

This taint prevented new pods from being scheduled on the node.  

**Attempts:**  
All the solutions I tried (pod restarts, evictions, cleanup, etc.) did **not lead to any result**.  

**Resolution:**  
Despite multiple attempts, no effective solution could be implemented due to the lack of access to the EC2 instance.




## Links
GitLab repository link: https://gitlab.com/nntamo/gitlab_devops_project_skyblue-devops
DockerHub link: https://hub.docker.com/repositories/nguetsop