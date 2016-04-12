call mvn -B -s settings.xml -DskipTests=true clean install
call java  -DDATABASE_URL="postgres://postgres:root@localhost:5432/timetable" -jar target/dependency/webapp-runner.jar target/*.war

