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




# install antlr
```
choco install antlr4
```
## or the hardway 
[antlr4/getting-started.md at master · antlr/antlr4](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md#windows)
[https://www.antlr.org/download/](https://www.antlr.org/download/)

```
antlr4 oranlang.g4
javac oranlang*.java
grun oranlang r -tree

yarn
yarn run generateParser
antlr4-tool -i && antlr4-tool -o parser oranlang.g4


SET CLASSPATH=.;C:\Javalib\antlr-4.9-complete.jar;%CLASSPATH%

C:\Users\o\oranapps\antlr-4.9.3-complete.jar
SET CLASSPATH=.;C:\Users\o\oranapps\antlr-4.9.3-complete.jar;%CLASSPATH%
.;C:\Program Files\Java\libs\antlr-4.9.3-complete.jar;%CLASSPATH%

<!-- antlr4 oranlang.g4 -->
java -jar C:\Users\o\oranapps\antlr-4.9.3-complete.jar oranlang.g4
javac oranlang*.java

java org.antlr.v4.gui.TestRig  oranlang r -tree


```
 -----------------
# Screenshots
- <!-- <img src="NNNNNNNNNNNNN" width="400"> -->


alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'











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