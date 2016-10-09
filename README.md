# tox-openstack-base

openstack base for tox

### 사용법

##### build base image

우선 base image를 build 합니다.
물론 IMAGE_NAME 을 자신의 docker io 혹은 registry 의 주소를 반영해서 사용해야 합니다.
```
./run.sh
```

##### build project caching images

각 프로젝트 별로 image를 build 합니다.
물론 IMAGE_NAME 을 자신의 docker io 혹은 registry 의 주소를 반영해서 사용해야 합니다.

```
cd projects/keystone
./run.sh
```

##### tox.sh 를 적당히 실행가능한 위치로 이동

```
cp tox.sh /usr/local/bin/
```

##### 이후에 해당 코드에 가서 tox.sh 로 테스트

참고: http://showterm.io/a99f79808c15d98f34cd3
```
tox.sh
```
