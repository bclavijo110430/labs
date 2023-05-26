FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /APP
COPY . /APP	
RUN ./mvnw package
VOLUME ["/artifacts"]
RUN cp target/spring-petclinic-3.0.0-SNAPSHOT.jar /artifacts


FROM eclipse-temurin:17-jdk-jammy
WORKDIR /APP
COPY --from=build  /APP/target/ ./
CMD [ "java","-jar","spring-petclinic-3.0.0-SNAPSHOT.jar"]
EXPOSE 8080


