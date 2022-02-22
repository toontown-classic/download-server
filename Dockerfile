# Start from a Apache based PHP base image to serve our constants file
FROM php:7.0-apache

# Allow overrides in Apache2
RUN echo "<Directory /var/www>\nOptions +Indexes\nAllowOverride All\nOrder allow,deny\nAllow from all\n</Directory>" >> /etc/apache2/apache2.conf &&\
    a2enmod rewrite &&\
    a2dissite 000-default &&\
    service apache2 restart

# Copy the contents of htdocs into the HTML web directory to be served by Apache
COPY htdocs /var/www/html/