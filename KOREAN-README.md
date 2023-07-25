# 링크 통합하기
<img src="https://github.com/euichan2322/Link-Integration/blob/dd/logo/sample-diagram.gif" width="1000">

Route 53, S3, cloudfront를 이용해 여러분의 url의 도메인과 경로를 통합하여 읽고 찾기 쉽게 만듭니다.

----

## 모듈 사용 방법

### 사전 준비 사항

1. Route 53 호스트 존
예시) euichan.com

2. 버지니아 북부(us-east-1) 리전에서 생성된 ACM 인증서
예시) *.euichan.com

3. AWS 권한
테라폼으로 관련 리소스를 생성할 수 있어야합니다.



## 시작하기
Linux
```
git clone https://github.com/euichan2322/Link-Integration
cd Link-Integration/
mv module/sample/ module/<your-name>
cd module/<your-name>
sed -i 's/euichan.com/<your domain>/' main.tf
sed -i 's/notion/<your platform>/' main.tf
sed -i '6s|euichan2322.notion.site/206b9e4a2f0e4aef99f4cfaf277fd27b?pvs=4|<your redirect target>|' main.tf
terraform init
terraform apply
```

<>안의 내용을 여러분의 상황에 맞게 수정해주세요.

## 주의사항

#### 1. S3 버킷의 이름은 platform.domain으로 생성됩니다.
ex) notion.euichan.com
S3 버킷의 이름은 전역적으로 고유해야합니다.

만약 같은 이름의 버킷이 있다면
[s3.tf] 파일의 2번째 줄을 수정해주세요

```
    bucket = "${var.platform}.${var.domain}" -> bucket = "<your bucket name>"
```
#### 2. 리전을 주의하세요
기본 리전은 서울리전입니다.
다른 리전을 사용하고 싶다면 [provider.tf]파일의 12번째 줄을 수정해주세요
```
  region = "ap-northeast-2"
```


[here]: https://github.com/euichan2322/Link-Integration/blob/dd/KOREAN-README.md
[여기]: https://github.com/euichan2322/Link-Integration/blob/dd/KOREAN-README.md
[s3.tf]: https://github.com/euichan2322/Link-Integration/blob/dd/s3.tf
[provider.tf]: https://github.com/euichan2322/Link-Integration/blob/dd/provider.tf
