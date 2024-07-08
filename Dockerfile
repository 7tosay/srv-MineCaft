FROM openjdk:21-jdk

RUN mkdir /minecraft
WORKDIR /minecraft

COPY mods /minecraft/mods/
COPY forge-1.18.2-40.2.21-installer.jar /minecraft/forge-1.18.2-40.2.21-installer.jar

# Установите Forge
RUN java -jar forge-1.18.2-40.2.21-installer.jar --installServer
# Установите EULA
RUN echo "eula=true" > eula.txt
RUN chmod +x run.sh
CMD ["./run.sh", "nogui"]