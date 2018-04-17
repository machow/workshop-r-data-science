# Variables below are used to connect to a digitalocean instance that I 
# created manually. You could also use their driver directly.
DM_IP_ADDRESS=xxx.xxx.xx.xx
DM_SSH_KEY=$(HOME)/.ssh/NAME_OF_YOUR_KEY

all:
	echo hey

clean:
	rm -rf home/*

machine:
	docker-machine create \
		--driver=generic \
		--generic-ip-address=$(DM_IP_ADDRESS) \
		--generic-ssh-user=root \
		--generic-ssh-key=$(DM_SSH_KEY) \
		--generic-ssh-port=22 \
		rstudio-server
