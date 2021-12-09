# oranlang
----
[![Open Source Love svg2](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


<!-- <img src="NNNNNNNNNNNNN" width="400"> -->


<h2 align="center">Fun little programming language which implements syntax id like to see</h2>

<h4 align="center">________________________</h4>










# Quick start
### 
##### 
```bash
pnpm install -g nearley 
pnpm install --save nearley 

nearleyc grammer.ne -o grammer.js
```
### sub lanuage features
```bash
nearleyc assingment.ne -o assingment.js
```

### how to generate rail road diagram
```bash
nearley-railroad grammer.ne -o grammer.html
pnpm install -g http-server nodemon
http-server

nodemon -w grammer.ne --exec 'nearley-railroad grammer.ne -o grammer.html && http-server'
``` 
## Open Broswer to [`http://localhost:3000`](http://localhost:3000)

---










# Summary
### -  *[Quick start](#Quick-start)*
### -  *[Installation](#Installation)*
### -  *[Deveopment](#For-developers)*
### -  *[Contributors](#Contributors)*
### -  *[Links](#Links)*
### -  *[License](#License)*













 
# Installation
### 
```bash
cd ~
git clone https://github.com/wisehackermonkey/oranlang.git
cd oranlang
```










 -----------------
# Screenshots
- <!-- <img src="NNNNNNNNNNNNN" width="400"> -->














-----------------
# Deveopment
### 
```bash
```












 
---
# Links
### 
### 
### 
### 
### 












 -----------------
# Contributors

[![](https://contrib.rocks/image?repo=wisehackermonkey/oranlang)](https://github.com/wisehackermonkey/oranlang/graphs/contributors)

##### Made with [contributors-img](https://contrib.rocks).

-----------------
# License
#### MIT © wisehackermonkey
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
```bash
by oran collins
github.com/wisehackermonkey
oranbusiness@gmail.com
11/22/2021
```
<!-- 

# Docker
### Build
```bash
cd ~
git clone https://github.com/wisehackermonkey/oranlang.git
cd oranlang
docker build -t wisehackermonkey/oranlang:latest .  
```
### Run
```bash
docker run -it --rm --name wisehackermonkey/oranlang:latest  
```
### Docker-compose
```bash
docker-compose build
docker-compose up 
```
# Publish Docker Image
```bash
docker build -t wisehackermonkey/oranlang:latest .
docker login
docker push wisehackermonkey/oranlang:latest
```
# Deploy on netlify
```
npm install netlify-cli -g
netlify login
netlify deploy
netlify deploy --prod
```
-->