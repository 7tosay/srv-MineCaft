FROM openjdk:21-jdk

RUN mkdir /minecraft
WORKDIR /minecraft

COPY server.properties /minecraft/
COPY forge-1.18.2-40.2.21-installer.jar /minecraft/forge-1.18.2-40.2.21-installer.jar

# Установите Forge
RUN java -jar forge-1.18.2-40.2.21-installer.jar --installServer
COPY TerraFirmaCraft-Forge-1.18.2-2.2.33.jar /minecraft/mods/
COPY Patchouli-1.18.2-71.1.jar /minecraft/mods/
# Установите EULA
RUN echo "eula=true" > eula.txt
RUN chmod +x run.sh
CMD ["./run.sh", "nogui"]