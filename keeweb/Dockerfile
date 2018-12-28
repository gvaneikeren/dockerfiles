From httpd:latest
RUN apt-get update && \
    apt-get install --assume-yes git

RUN git clone -b gh-pages https://github.com/keeweb/keeweb.git /usr/local/apache2/htdocs

EXPOSE 80
	
CMD ["httpd-foreground"]
