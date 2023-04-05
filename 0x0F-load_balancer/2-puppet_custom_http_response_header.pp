# Automation that creates a custom http header response with puppet
exec { 'command':
	command => 'apt-get -y update;
	apt-get -y install nginx;
	sudo sed -i " listen 80 default_server;/a add_header X-Server-By $HOSTNAME;" /etc/nginx/sites-available/default;
	service nginx restart',
	provider => shell,
}
