#!/bin/bash

set -ex

##################
# apt repository #
##################

# nginx(maineline)
add-apt-repository ppa:nginx/development -y

# update
apt-get update

###################
# apt-get install #
###################

# nginx
apt-get install nginx -y

# postgresql
apt-get install postgresql postgresql-contrib -y

# other
apt-get install git-core \
                curl \
                zlib1g-dev \
                build-essential \
                libssl-dev \
                libreadline-dev \
                libyaml-dev \
                libsqlite3-dev \
                sqlite3 \
                libxml2-dev \
                libxslt1-dev \
                libcurl4-openssl-dev \
                python-software-properties \
                libpq-dev \
                libffi-dev -y

# remove system ruby
apt-get purge ruby

###################
# start & enabled #
###################

# nginx
systemctl start nginx
systemctl enable nginx

# postgresql
systemctl start postgresql
systemctl enable postgresql

#########
# ruby  #
#########

# rbenv
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
cat <<'RBENV' >/etc/profile.d/rbenv.sh
export RBENV_ROOT="/usr/local/rbenv"
export PATH="${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init --no-rehash -)"
RBENV
source /etc/profile.d/rbenv.sh
chown vagrant:vagrant  -R /usr/local/rbenv/

# ruby install
rbenv install 2.2.2
rbenv global 2.2.2

# bundler install
rbenv exec gem install bundler --no-ri --no-rdoc
