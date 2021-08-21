# spring-cloud-data-flow
spring-cloud-data-flow(SCDF) 구축해보기.

내용 및 실행 방법은 블로그에 자세히 기록해뒀으니 참고 부탁드립니다 :)
https://programmer-chocho.tistory.com/13


1.DB생성 및 spring batch 메타테이블 생성  
DockerFile 폴더에서 docker-compose 파일 실행 
```
docker-compose up 
```

2.spring batch 데모 프로젝트 실행. 
```
java -jar {path}/billrun-0.0.1-SNAPSHOT.jar \
--spring.datasource.url=jdbc:mysql://localhost:3306/task \
--spring.datasource.username={username} \
--spring.datasource.password={password} \
--spring.datasource.driverClassName=com.mysql.jdbc.Driver \
--spring.datasource.initialization-mode=always \ // bill_statement 테이블을 초기화
```

3. SCDF 설치 
```
curl -k -L --output spring-cloud-dataflow-server-2.8.1.jar https://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-server/2.8.1/spring-cloud-dataflow-server-2.8.1.jar
```

4. SCDF 실행  
```
java -jar spring-cloud-dataflow-server-2.8.1.jar \
--spring.datasource.url=jdbc:mysql://localhost:3306/task \   //연동하는 DB
--spring.datasource.username=batch_user \ // DB 계정
--spring.datasource.password=batch_user \ // DB 패스워드
--spring.datasource.driver-class-name=org.mariadb.jdbc.Driver \
--spring.cloud.dataflow.features.streams-enabled=false \ //대기열큐 활성화 여부, 배치잡 모니터링 시에는 필요없음
--spring.flyway.enabled=false // 실행할때마다 메타테이블 매번 생성 여부
```

