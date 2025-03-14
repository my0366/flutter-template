# Getting Started

개발하면서 불편했던 점을 해소하고자 기본적인 설정과 의존성을 추가한 플러터 프로젝트 템플릿입니다.

Riverpod을 사용하면 기본적으로 provider는 전역적으로 사용할 수 있는 점이 장점이자 단점입니다.

![aa](https://github.com/user-attachments/assets/a0ac59d2-236d-4cc4-bba2-99daf195f3fa)

어느곳에서는 접근이 가능하다는 것은 **스파게티 코드**가 될 수 있다는 것을 의미 하며, 프로젝트의 구조를 파악하지 못 한 사람이 참여하게되면 이미 Provider가 구현되어 있어도 어디 있는지 모르기 때문에 다시
구현하게되는 대참사가 일어날 수도 있습니다. 이런 문제를 고민하던
중에 [Riverpod을 맛있게 사용 하는 글](https://medium.com/jobkorea-tech/flutter-riverpod%EC%9D%84-%EB%A7%9B%EC%9E%88%EA%B2%8C-%EB%AF%B9%EC%8A%A4%EC%9D%B8-%ED%95%98%EA%B8%B0-a7d2481396ff)
을 참고했는데 많은 도움이 되었습니다. 위 사진도 해당 글에서 가져왔습니다.

아키텍쳐의 구조는 [FSD(Future Slice Design)](https://emewjin.github.io/feature-sliced-design/)를 기반으로 하고있으며, Riverpod을 맛있게 사용하는
글의 내용도 참고하였습니다.

# Version

```bash
flutter : 3.27.4
dart : 3.6.2
```

# Dependencies

- [flutter_riverpod](https://pub.dev/packages/flutter_bloc)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [gap](https://pub.dev/packages/gap)
- [go_router](https://pub.dev/packages/go_router)
- [dio](https://pub.dev/packages/dio)
- [freezed](https://pub.dev/packages/freezed)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [logger](https://pub.dev/packages/logger)
- [mockito](https://pub.dev/packages/mockito)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- [permission_handler](https://pub.dev/packages/permission_handler)

# 프로젝트 구조

<img width="968" alt="Untitled" src="https://github.com/user-attachments/assets/a6e1ab76-b0aa-4198-9635-12b572cf9365" />

### 🔹 shared

특정 비즈니스 로직에 종속되지 않은 **재사용 가능한 컴포넌트와 유틸리티**가 포함된 레이어입니다.

- `utils` : 애플리케이션 전반에 사용되는 유틸리티 함수들의 집합
- `data` : 애플리케이션 데이터에 접근하는 클래스들의 집합
    - `local` : 앱 내부 저장소에 대한 데이터 접근
    - `remote` : 네트워크 요청을 처리하는 클래스들

---

### 🔹 entities

비즈니스 **엔티티 (Entity, Model, DTO)** 를 나타내는 레이어입니다.

---

### 🔹 app

애플리케이션이 **초기화**되는 레이어입니다.

- `app.dart` : 애플리케이션 로직 초기화
- `app_providers.dart` : 전역적으로 사용되는 Provider 정의 (예: 테마 설정)
- `routes.dart` : 애플리케이션의 모든 경로(Route) 정의

---

### 🔹 pages

애플리케이션의 **페이지 집합**입니다.  
페이지는 다음과 같은 구조를 가집니다:

- `page` : UI 레이아웃을 정의
- `state` : 상태 관리
- `event` : 이벤트 처리

📌 예제

- `home` : 숫자 증감 예시 페이지

---

### 🔹 features

특정 **기능 단위**로 구성된 레이어입니다.

- `count` : home 페이지에서 사용되는 숫자 증감 기능의 구현체

---

### 🔹 features

앱에 사용되는 UI 컴포넌트들의 집합입니다.

# Testing

[공식문서](https://riverpod.dev/docs/cookbooks/testing/)를 참고하였으며, 해당 템플릿에는 Home화면에서 일어나는 테스트에 대해 작성되어 있습니다.

테스트시에 사용되는 클래스는 별도로 구성해줘야합니다.
HomePage에서 사용되는 클래스(HomeEvent, Home State)에 대한 내용을 복제본(HomeEventTest, HomeStateTest)을 만들어서
사용해줘야합니다.

```code
mixin class HomeEventTest {
  void fetchCount(ProviderContainer container) => container.read(countNotifierProvider.notifier).fetchCount();
  void increment(ProviderContainer container) => container.read(countNotifierProvider.notifier).increment();
  void decrement(ProviderContainer container) => container.read(countNotifierProvider.notifier).decrement();
}
```

테스트 환경에서는 createContainer()를 통해 ProviderContainer를 생성해주기 때문에 HomeEventTest내에서는 WidgetRef가 아닌 ProviderContainer를 주입해줘야
테스트가 가능합니다.

```code
mixin class HomeStateTest {
  int count(ProviderContainer container) => container.read(countNotifierProvider).count;
}
```

또한 State에 접근하기 위해서는 watch()를 통해 접근하는 것이 아닌 read()를 통해 접근이 가능합니다.

위 2가지 사항을 준수하여 테스트를 진행하면 됩니다.

이렇게 테스트를 진행하게 되니 페이지에서 어떤 provider를 사용하는지, 어떤 상태에 대한 값이 필요한지 명확해지는 효과가 있었고 이를 통해 테스트의 범위도 정해지는 부분이 유용했습니다. 다만
event,state가 추가 되거나 변경될 경우에 추가적으로 업데이트를 해줘야하는 번거로움도 동시에 존재했습니다( 이 부분은 Ximya님이 package를 제작할 것아라고 말씀하셨습니다... 언제 나올지는 모름)


