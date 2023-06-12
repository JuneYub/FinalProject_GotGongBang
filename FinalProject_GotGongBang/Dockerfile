# 베이스 이미지 설정
FROM tomcat:9.0-jdk8

# 애플리케이션 WAR 파일 복사
COPY /home/runner/work/FinalProject_GotGongBang/FinalProject_GotGongBang/FinalProject_GotGongBang/target/FinalProject_GotGongBang.war /usr/local/tomcat/webapps/gotgongbang.war

# 톰캣 실행
CMD ["catalina.sh", "run"]
