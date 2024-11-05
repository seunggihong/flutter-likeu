# Capstone Design Project

<h3 align="center"> APP ICON </h3>

<p align="center">
    <img width="180" alt="icon-512-maskable" src="https://github.com/user-attachments/assets/4f01dd84-460b-4967-831b-0612bf3e08ee" >
</p>

<h3 align="center"> INFOMATION </h3>

<p align="center">
    <img width="180" alt="lk_1" src="https://github.com/user-attachments/assets/dc102056-e69a-4ada-945c-2048b31715ec">
    <img width="180" alt="lk_2" src="https://github.com/user-attachments/assets/8888d51a-23ca-4679-b0c8-cf48773403a6">
    <img width="180" alt="lk_3" src="https://github.com/user-attachments/assets/f74127f3-e01f-4763-91a4-2f473440bece">
</p>

## 목차

### 1. **[프로젝트 소개](#project_info)**

### 2. **[팀원 및 역할 소개](#team_info)**

### 3. **[개발 환경](#tools)**

### 4. **[어플리케이션 구성도](#app_info)**

### 5. **[플로우차트](#flow_chart)**

### 6. **[데이터베이스 구성도](#database)**

### 7. **[추가 정보](#ref)**

<a name='project_info'></a>

## 1. 프로젝트 소개 🔥

### **_사용자가 좋아하는 NBA 선수와 자유투 자세를 비교 및 코칭 애플리케이션 (LikeU)_**

최근 기술 발전으로 인해 객체 탐지 및 분석 기술에 대한 접근성이 높아졌다.
스포츠 분야에서도 활용 가능성이 커지고 있으며, 특히 선수의 성능과 기술적인 측면을 분석하는 데 대한 수요가 증가하고 있다.
이에 따라, 저희는 평소에 흥미를 가졌던 농구와 전공 지식을 결합하여, 사용자의 자세를 프로 선수의 자세와 비교 분석하는 프로젝트를 진행하게 되었다.
이 프로젝트의 궁극적인 목표는 농구라는 스포츠에 대한 사용자들의 흥미를 더욱 증진시키고, 기술적인 분석을 통해 개인의 운동 능력을 향상시키는 데 기여할 것이다.

<a name='team_info'></a>

## 2. 팀원 및 역할 소개 🙋‍♂️

### 🚀 김은수

- 팀장
- `OpenCV`와 `YOLO 11`을 사용한 키포인트 추출 총괄

<a href="https://github.com/ensookim">![Static Badge](https://img.shields.io/badge/Github-EunSooKim-%23181717?style=for-the-badge&logo=Github)
</a>

### 🚀 홍승기

- `Flutter`를 사용한 Cross platform App 개발 총괄

<a href="https://github.com/seunggihong">![Static Badge](https://img.shields.io/badge/Github-seunggihong-%23181717?style=for-the-badge&logo=Github)
</a>

### 🚀 허준영

- `Flask API`를 사용한 REST API 서버 구축 총괄

<a href="https://github.com/snilsnil">![Static Badge](https://img.shields.io/badge/Github-snilsnil-%23181717?style=for-the-badge&logo=Github)
</a>

### 🚀 김기종

- `App Design` 및 `Documentation` 총괄

<a href="https://github.com/rrangeess">![Static Badge](https://img.shields.io/badge/Github-rrangeess-%23181717?style=for-the-badge&logo=Github)
</a>

<a name='tools'></a>

## 3. 개발 환경 📺

| 항목          | 내용                                |
| ------------- | ----------------------------------- |
| **운영체제**  | Windows 11, Mac OS                  |
| **개발 도구** | Visual Studio Code, Git & GitHub    |
| **개발 언어** | Dart (Front-end), Python (Back-end) |
| **기술 스택** | Flutter, Flask API, OpenCV, YOLO 11 |

<a name='app_info'></a>

## 4. 어플리케이션 구성도 📌

<p align="center">
    <img width="1039" alt="image" src="https://github.com/user-attachments/assets/66d3aa08-075f-4600-93cf-742803606d42">
</p>

<a name='flow_chart'></a>

## 5. 플로우 차트 📌

<p align="center">
    <img width="1327" alt="image" src="https://github.com/user-attachments/assets/9ba049a2-9c4c-4b80-9ea0-c1b05068618d">
</p>

<a name='database'></a>

## 6. 데이터베이스 구성도 📌

Flutter의 Hive NoSQL Database를 사용했다.

```json

{
    "user": {
        "percent": {
            "similarity" : 100,
            "arm_degree" : [...],
            "knee_degree" : [...]
        }
    }
}

```

<a name='ref'></a>

## 7. 추가 정보 🚀

- Flask REST API : [Go to Github Page](https://github.com/snilsnil/likeu_flask)
