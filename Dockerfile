# Usa una imagen base de OpenJDK con JRE optimizado
FROM openjdk:17-jdk-slim

# Crea un directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo JAR de la aplicación al contenedor

COPY target/usuario-service-0.0.1-SNAPSHOT.jar app.jar

# Establece variables de entorno predeterminadas (puedes sobrescribirlas al iniciar el contenedor)
#ENV SPRING_PROFILES_ACTIVE=prod
#ENV SPRING_DATA_MONGODB_URI=mongodb://usuario:contraseña@host:puerto/nombre_base_datos

ARG SPRING_PROFILES_ACTIVE=prod
ARG SPRING_DATA_MONGODB_URI=mongodb://usuario:contraseña@host:puerto/nombre_base_datos
ARG SPRING_PORT=8080

ENV SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE
ENV SPRING_DATA_MONGODB_URI=$SPRING_DATA_MONGODB_URI
ENV SPRING_PORT=$SPRING_PORT
# Expone el puerto en el que se ejecuta la aplicación
EXPOSE $SPRING_PORT

# Define el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]

