FROM httpd:latest
COPY index.html /var/www/html/

# or 

FROM debian:latest

# Install Apache2
RUN apt update && apt install -y apache2

# Copy your HTML file
COPY index.html /var/www/html/

# Expose Apache's default port
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

