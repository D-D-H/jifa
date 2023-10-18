FROM eclipse-temurin:17-jdk
VOLUME /tmp
ARG DEPENDENCY=/workspace/server/build/dependency
COPY --from=jifa-local-build:latest ${DEPENDENCY}/BOOT-INF/lib /jifa/lib
COPY --from=jifa-local-build:latest ${DEPENDENCY}/META-INF /jifa/META-INF
COPY --from=jifa-local-build:latest ${DEPENDENCY}/BOOT-INF/classes /jifa
ENTRYPOINT ["java","--add-opens=java.base/java.lang=ALL-UNNAMED","--add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED","-Djdk.util.zip.disableZip64ExtraFieldValidation=true","-cp","jifa:jifa/lib/*","org.eclipse.jifa.server.Launcher"]