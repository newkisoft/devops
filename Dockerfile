FROM jenkins/jenkins:2.249.3-slim
USER root
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update;
RUN apt-get install -y apt-transport-https  
RUN apt-get update  
RUN apt-get install -y dotnet-sdk-3.1
RUN apt-get install -y dotnet-sdk-5.0
RUN apt-get install -y dotnet-runtime-5.0
RUN apt-get install -y git-all
RUN apt-get update && apt-get install -y libgdiplus

RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install -y nano 
RUN jenkins-plugin-cli --plugins blueocean:1.24.3
ADD id_rsa /root/.ssh/id_rsa
ADD known_hosts /root/.ssh/known_hosts
#ADD id_rsa.pub /root/.ssh/id_rsa.pub
#ADD authorized_keys /root/.ssh/authorized_keys
#ADD key.pem /tmp/key.pem
#ADD website.sh /tmp/website.sh
#RUN chmod 600 /tmp/*.pem
#RUN chmod 600 /root/.ssh/id_rsa
RUN git clone https://github.com/newkisoft/newki-libraries.git
RUN wget https://github.com/loic-sharma/BaGet/releases/download/v0.3.0-preview4/BaGet.zip
RUN unzip BaGet.zip -d BaGet
RUN apt install -y nodejs
RUN apt install -y npm
WORKDIR /BaGet/

