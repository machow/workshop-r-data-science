FROM rocker/hadleyverse

ADD setup/requirements.R requirements.R
RUN Rscript requirements.R

# create user's home dir on login, if it doesn't exist
# see https://help.ubuntu.com/community/LDAPClientAuthentication
ADD setup/my_mkhomedir /usr/share/pam-configs/my_mkhomedir
RUN DEBIAN_FRONTEND=noninteractive pam-auth-update

# create user accounts
ADD setup/users.txt users.txt
RUN for ii in $(cat users.txt); \
        do HOME=/home useradd --create-home -p $(openssl passwd -1 abc) $ii; \
    done;

ADD workshop /etc/skel
