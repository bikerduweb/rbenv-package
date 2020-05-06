FROM ubuntu:bionic

MAINTAINER bikerduweb "https://github.com/bikerduweb"

# Install packages for building ruby
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --force-yes build-essential curl git zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

# Install rbenv, ruby-build and rbenv-default-gems
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN git clone https://github.com/sstephenson/rbenv-default-gems.git /usr/local/rbenv/plugins/rbenv-default-gems
RUN git clone https://github.com/rkh/rbenv-update.git /usr/local/rbenv/plugins/rbenv-update

# config
ENV PATH /usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv
ENV CONFIGURE_OPTS --disable-install-doc --with-arch=i686 --enable-shared

RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc
# configure gem install
RUN echo 'gem: --no-rdoc --no-ri' >> /root/.gemrc

# Install multiple versions of ruby
ADD ./versions.txt /root/versions.txt
ADD ./gems.txt /usr/local/rbenv/default-gems
ADD ./build_packages.sh /root/build_packages.sh


# build
RUN rbenv update
RUN xargs -L 1 rbenv install < /root/versions.txt
RUN rbenv global $(head -n 1 /root/versions.txt)
# create package
RUN rbenv exec gem install fpm
CMD sh /root/build_packages.sh
