#!/bin/bash

export LANG=en_US.UTF-8

# generate bbb folders
mkdir -p /var/bigbluebutton/recording/raw
mkdir -p /var/bigbluebutton/recording/process
mkdir -p /var/bigbluebutton/recording/publish
mkdir -p /var/bigbluebutton/recording/status/recorded
mkdir -p /var/bigbluebutton/recording/status/archived
mkdir -p /var/bigbluebutton/recording/status/processed
mkdir -p /var/bigbluebutton/recording/status/sanity
mkdir -p /var/bigbluebutton/published
mkdir -p /var/bigbluebutton/deleted
mkdir -p /var/bigbluebutton/unpublished

# -- fix directory permissions
chown -R bigbluebutton:bigbluebutton /var/bigbluebutton

dockerize \
    -template /usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties.tmpl:/usr/share/bbb-web/WEB-INF/classes/bigbluebutton.properties \
    -template /usr/share/bbb-apps-akka/conf/application.conf.tmpl:/usr/share/bbb-apps-akka/conf/application.conf \
    -template /usr/share/bbb-web/WEB-INF/classes/spring/turn-stun-servers.xml.tmpl:/usr/share/bbb-web/WEB-INF/classes/spring/turn-stun-servers.xml \
    /usr/bin/supervisord --nodaemon
