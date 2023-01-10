ls

rm -rf /tmp/.ssh

mkdir -p /tmp/.ssh

ls

+trigger_get_credentials

chmod 400 /tmp/.ssh/bb 

cat /tmp/.ssh/bb

eval `ssh-agent -s`

export GIT_SSH="/tmp"

export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/tmp/.ssh/known_hosts -i /tmp/.ssh/bb"

ssh-add /tmp/.ssh/bb 2>&1

ssh-add -l

git config --global http.postBuffer 524288000

+trigger_get_source

ls

+trigger_pack

ls
