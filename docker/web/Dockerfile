FROM ruby:2.3

############################################################
# ruby setting bundlerだけはglobalに入れておく
RUN gem install bundler

#####################################################
# misc settings
RUN usermod -u 1000 www-data
RUN \cp -fp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

VOLUME /var/myapp
WORKDIR /var/myapp

EXPOSE 3000

CMD ["bash"]
