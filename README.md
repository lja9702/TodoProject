# TodoProject
## 1. JAVA 8설치
* 자바 해석기 설치
```bash
$ sudo apt-get install openjdk-8-jre-headless
```
* 자바 컴파일러 설치
```bash
$ sudo apt-get install openjdk-8-jdk
```

## 2. Apache Tomcat 8 설치
* tomcat8 설치
```bash
$ sudo apt-get install tomcat8
```
* 설치된 tomcat 버전 확인
```bash
$ /usr/share/tomcat8/bin/version.sh
```
* 톰캣 동작 확인
  * 에 http://localhost:8080 입력

## 3. mySQL 설치
* mySQL(v5.7)설치
```bash
$ sudo apt-get install mysql-server mysql-client
```
* mySQL 서비스 시작
```bash
$service mysql start
```
* 진입
```bash
$ mysql -u(userID) -p(userPassword) mysql
```
```sql
mysql> create user 'todo'@'%' identified by '1234'; #todo사용자 권한 설정

mysql> use mysql;  #mysql DB사용

mysql> create database todoDB;  #todoDB 생성

mysql> alter database todoDB default character set utf8 collate utf8_general_ci;
#utf8로 인코딩 설정

mysql> use todoDB #todoDB사용
CREATE TABLE todolist (
  todo_id int(11) NOT NULL AUTO_INCREMENT,
  todo_title varchar(50) NOT NULL,
  todo_memo varchar(200) DEFAULT NULL,
  todo_duedate varchar(15) DEFAULT NULL,
  todo_complete tinyint(1) DEFAULT 0,
  todo_priority int(11) DEFAULT 5,
  PRIMARY KEY (todo_id)
);  #todolist 테이블 생성

mysql> show tables;

mysql> grant all privileges on todoDB.* to 'todo'@localhost identified by "1234";
#user creation and privileges

mysql> flush privileges;
```
## 4. jdbc 드라이버 설치
* libmysql-java 패키지 설치 및 설정
```bash
$ sudo apt-get install libmysql-java

$ sudo cp /usr/share/java/mysql-connector-java-5.1.38.jar /usr/lib/jvm/java-8-openjdk-amd64/lib
```
* 환경변수 세팅
```bash
$ vi ~/.bash_profile

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
export PATH
CLASSPATH=$CLASSPATH:$JAVA_HOME/lib/tools.jar$JAVA_HOME/lib/mysql-connector-    java-5.1.38.jar:.
export CLASSPATH
```
TodoProject를 받는다.

## 5. tomcat에 TodoProject안에 있는 todoProject.war파일 배포

* war파일 복사
```bash
$cd /var/lib/tomcat8/webapps/
$ sudo cp (PATH)/TodoProject/todoProject.war ./
```
  * PATH는 TodoProject를 받은 경로

* server.xml 복사
```bash
$cd /etc/tomcat8
$sudo cp (PATH)/TodoProject/server.xml ./
```
* 서버 재시작
```bash
$sudo service tomcat8 restart
```

## 6. 브라우저에 http://localhost:8080/todoProject/todo/index.jsp 입력
