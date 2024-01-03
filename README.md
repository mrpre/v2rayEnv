# build image
docker build -t localhost/localimage:latest .  

# run container background
docker run --net host  -d --restart=always  localhost/localimage:latest  

# Shadowrocket configure
Address: (public address of your host where this container running on)  
Port: 443 (your nginx listen port)  
UID: (same as `inbounds.settings.clients.id` in v2ray.json)  
Alter ID: 0  
Method: auto  
TLS: on  
Allow Insure: on (because we are using a self signed certificate)  
Transport: 
  - name: websocket
  - Host: (same as `server_name` in v2ray_nginx.json) 
  - Path: (same as `inbounds.streamSettings.wsSettings.path` in v2ray.json and `location` in v2ray_nginx.json) 
