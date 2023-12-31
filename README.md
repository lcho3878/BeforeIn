<img src="https://github.com/lcho3878/BeforeIn/assets/60124491/8c1227bd-91e7-4c1c-990b-94d82307e38b" width="2000"/>

# nbcamp-Project-BeforeIn
[내일배움캠프 iOS트랙] iOS 앱개발 최종 프로젝트
<br>
<img src="https://github.com/lcho3878/BeforeIn/assets/74814587/2d12cf52-fbcf-4929-8420-b6aee147ae4b" width="200" height="200"/>
<br>
"비포인(BeforeIn)"<br>
- 당신의 에티켓 점수는 몇점인가요?
- 어딘가 들어가기전, 지켜야할 에티켓을 체크해보세요!
<br>


<a href="https://apps.apple.com/kr/app/%EB%B9%84%ED%8F%AC%EC%9D%B8-%EB%8B%B9%EC%8B%A0%EC%9D%98-%EC%97%90%ED%8B%B0%EC%BC%93-%EC%A0%90%EC%88%98%EB%8A%94-%EB%AA%87%EC%A0%90%EC%9D%B8%EA%B0%80%EC%9A%94/id6471390154">→ App Store로 이동</a>
<br><br><br><br>



## 🧑🏻‍💻 프로젝트 소개
"에티켓 정보 제공 앱 프로젝트"<p> 


이 프로젝트는 Swift 언어를 사용하여 Xcode에서 개발한 애플리케이션입니다. <br>
우리 팀의 어플은 에티켓 정보 정달 및 공유를 위한 플랫폼으로, 주요 기능은 아래와 같습니다.
1. **장소 및 상황별 에티켓 제공**: 장소 및 상황에 따른 지키고 피해야할 에티켓들을 제공합니다.
2. **에티켓 퀴즈**: 사용자들은 에티켓과 관련된 O,X퀴즈를 풀어 결과에 따른 에티켓 레벨을 부여받습니다.
3. **에티켓 숲(커뮤니티)**: 사용자들은 에티켓 숲에서 일상과 관련된 대화를 나누거나, 에티켓에 관한 정보들을 교환할 수 있습니다.

<br>
이와 같은 기능을 통해 사용자들은 에티켓과 관련된 정보를 공유하고 소통할 수 있습니다. <br><br>

프로젝트 발표 자료 - 🔗[231116 6조_비포인(BeforeIn)_최종발표.pdf](https://github.com/lcho3878/BeforeIn/files/13425996/231116.6._.BeforeIn._.pdf)


<br><br>

## 🛠️ 사용한 기술 스택 (Tech Stack)
Programming: <img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white" height="20">
<br>
Communication: <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" height="20"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white" height="20"> <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white" height="20">
<br>
FrameWork: <img src="https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white" height="20">
<br>
Design: <img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white" height="20">


<br><br>
## 아키텍쳐
<img src="https://github.com/lcho3878/BeforeIn/assets/74814587/767bf269-715c-46c0-9a89-8ccd8881bd0f" width="500" height="800">

<br><br>

## 🗓️ 개발 기간
* 2023-10-10(화) ~ 2023-11-17(금)

<br><br>

## 💁🏻 개발자

| 역할 | 이름 | 깃허브 |
|------|---|---|
| Leader | 이찬호 | [lcho3878](https://github.com/lcho3878) |
| Associate-Leader | 이한솔 | [Leehan-sol](https://github.com/Leehan-sol) |
| iOS Developer | 김상훈 | [Sanghun K.](https://github.com/sanc93) |
| iOS Developer | 김도연 | [Daisy Kim](https://github.com/doyeonyyy) |
| iOS Developer | 허수빈 | [Heasoobean](https://github.com/Heasoobean/) |


<br><br>

## 📌 주요 기능
#### 메인 페이지
- 랜덤 한줄 에티켓 제공(새로고침 버튼을 이용해 새로고침)
- 최근 본 에티켓 최대 6개 제공
- 카테고리별 랜덤 에티켓 추천
- 퀴즈 다시 풀러 가기 제공
#### 퀴즈페이지
- 많은 에티켓들 중, 10문제를 랜덤으로 제공
- 퀴즈의 정답 수에 따라 레벨 부여
- 신규 회원의 경우 로그인 후 퀴즈페이지로 자동 진입
- 사용자의 의도에 따라 건너뛰기 가능
#### 검색 페이지
- 에티켓 카테고리별 검색기능 제공
- 에티켓 클릭 시 디테일 페이지로 이동
#### 디테일 페이지
- 장소 및 상황별 지키고, 피해야할 에티켓 컨텐츠 카드 제공
#### 글쓰기 페이지
- 사진 첨부 및 수정(삭제)
- 글 작성 가이드 제공
#### 에티켓숲 페이지(커뮤니티)
- 에티켓숲 게시물을 모아보는 피드
- 카테고리별 필터기능 제공
- 차단한 유저의 게시글은 블락처리됨
#### 에티켓숲 게시글 페이지
- 에티켓숲 게시물의 상세 페이지
- 댓글을 통한 사용자간의 소통 가능
- 차단한 유저의 댓글은 블락처리됨
#### 에티켓숲 게시글 작성 및 수정 페이지
- 제목 길이 20자 제한
- 본문 길이 2000자 제한
- 카테고리(일상잡담, 궁금해요) 제공
- 글 작성시 기본적으로 커뮤니티 이용약관 제공
#### 내정보 페이지
- 계정정보 수정 및 이미지 변경 등 프로필 관리
- 차단한 유저 차단해제 기능 제공
- 커뮤니티 이용규칙 제공
- 앱 정보 페이지 제공
- 라이트모드/다크모드 설정
#### 앱정보 페이지
- 공지사항, 서비스 이용약관, 개인정보 처리방침 제공
- 개발자에게 문의하기 기능 제공


<br><br>

## 🧐 앱 실행 및 사용 방법

https://github.com/lcho3878/BeforeIn/assets/74814587/c0c8b629-781e-4734-b9cc-f4e25ab3d89c





<br><br>

## 💥 트러블 슈팅
- 앱을 빌드할 때마다 파이어베이스에서 데이터를 가져오기 때문에 서버 대역폭 용량이 부족하였다.
  ```
  - 원인(이유): 앱을 빌드할 때마다, 새로운 이미지를 서버에서 가져왔다.
  - 해결(대처): 기본적으로 제공되는 컨텐츠 이미지는 디스크 캐싱, 유저의 프로필 사진은 메모리 캐싱을 통해서 해결
  ```
- 커뮤니티 유저 차단에 따른 즉각 업데이트 로직을 고민하는 것이 매우 어려웠다. 
  ```
  - 원인(이유): viewWillAppear를 통해 매번 업데이트를 진행하자니 불필요한 메모리와 데이터의 소모량이 증가했다.
  - 해결(대처): viewDidLoad에 현재 로그인한 유저의 차단리스트 원소 갯수를 부여한 상수 blockListCount를 추가한 뒤,
  viewWillAppear에서 blockListCount와 현재 로그인한 유저의 차단리스트를 비교하여 다를 경우 업데이트를 진행하도록 수정하여,
  차단 리스트가 변경 되었을 경우에만 업데이트를 진행하도록 구현하였다.
  ```
- 커뮤니티 기능 추가 중 콜렉션 셀(카테고리)에 따라 해당 카테고리 게시물을 필터링하여 표시하는 것에 어려움을 겪음, 앱을 빌드 되나 커뮤니티 페이지 진입시 모든 게시물이 표시되지 않음.
  ```
  - 원인(이유): 테이블뷰가 그려지지 않고 있었음, 데이터 불러오고 있지 않았음.
  - 해결(대처): 적절한 데이터 요청 메서드를 사용하여 데이터를 불러오게끔 함.
  ```
- 커뮤니티 게시글/댓글 작성자 신고 버튼 구현하는 게 어려웠다.
  ```
  원인(이유): 로직은 회의 때 방법을 알려주셔서 어떻게 할지는 머릿속에 그려졌는데, 이전에 Firebase 코드를 짜보지 않아서 처음에 조금 낯설었고,
  무엇보다 어떤 형태의 값을, 어떤 식으로 Firebase에 전달해야 하는지, 가공해서 넘기는게 어려웠던 것 같다.
  해결(대처): Firebase 관련해서는 다른 참고할 만한 기존 코드가 많이 있어서 참고하거나 인터넷을 찾아보았고,
  데이터 구조를 하나하나 생각하며 어떻게 가공해서 넘길지 고민해보았다
  ```
