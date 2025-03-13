# flutter_template

## Getting Started

개발하면서 불편했던점을 해소하고자 기본적인 설정과 의존성을 추가한 플러터 프로젝트 템플릿입니다.

아키텍쳐의 구조는 FSD(Future Slice Design)를 기반으로 하고
있으며, [Riverpod을 맛있게 사용 하는 글](https://medium.com/jobkorea-tech/flutter-riverpod%EC%9D%84-%EB%A7%9B%EC%9E%88%EA%B2%8C-%EB%AF%B9%EC%8A%A4%EC%9D%B8-%ED%95%98%EA%B8%B0-a7d2481396ff)
의 내용도 참고하였습니다.

## Dependencies

- [flutter_riverpod](https://pub.dev/packages/flutter_bloc)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [gap](https://pub.dev/packages/gap)
- [shadcn_ui](https://pub.dev/packages/shadcn_ui)
- [go_router](https://pub.dev/packages/go_router)
- [dio](https://pub.dev/packages/dio)
- [freezed](https://pub.dev/packages/freezed)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [logger](https://pub.dev/packages/logger)
- [mockito](https://pub.dev/packages/mockito)

## Motivation

Riverpod을 사용하면 기본적으로 provider는 전역적으로 사용할 수 있는 점이 장점이자 단점입니다.

어느곳에서는 접근이 가능하다는 것은 스파게티 코드가 될 수 있다는 문제를 야기하는데요, 위에 Riverpod을 맛있게 사용하는 방법을 보고 이 문제를 해결할 수 있게 되었습니다.

## Basic information

```bash
flutter : 3.27.4
dart : 3.6.4
```

## How to use

```bash
flutter pub get
flutter run
```

## Features

app: 애플리케이션 로직이 초기화되는 곳입니다.

- app.dart : 애플리케이션 로직이 초기화되는 곳입니다.
- app_providers.dart : 애플리케이션에 전역적으로 사용되는 provider를 정의 합니다(현재는 테마만 정의 되어있음).
- routes.dart : 애플리케이션의 모든 경로를 정의합니다.

pages: 이 레이어에는 애플리케이션의 페이지들의 집합입니다. 구성요소로는 page, state, event로 구성되어있습니다.

- home : 숫자 증감 예시 페이지

features: 이 레이어는 특정 기능에 대한 집합입니다. 기능 단위로 구성됩니다.

- count : home 페이지에서 사용되는 증감 기능들의 구현체입니다.

entities: 이 레이어는 비즈니스 엔티티를 나타냅니다.

- 예를 들면 dto, model, entity가 포함될 수 있습니다.

shared: 이 레이어에는 특정 비즈니스 로직에 종속되지 않은 재사용 가능한 컴포넌트와 유틸리티가 포함되어 있습니다.

- utils : 애플리케이션 전반에 사용되는 유틸리티 함수들의 집합입니다.
- data : 애플리케이션 데이터에 대해 접근하는 클래스들의 집합입니다.
    - local : 앱 내부에 저장되는 데이터들에 대한 접근하는 클래스들의 집합입니다.
    - remote : 네트워크 요청이 발생하는 클래스들의 집합입니다.

widgets: 앱에 사용되는 UI 컴포넌트들의 집합입니다.

## Testing

[공식문서](https://riverpod.dev/docs/cookbooks/testing/)를 참고하였으며, 해당 템플릿에는 Home화면에서 일어나는 테스트에 대해 작성되어 있습니다.

테스트시에 사용되는 클래스는 별도로 구성해줘야합니다. HomePage에서 사용되는 클래스(HomeEvent, Home State)에 대한 내용을 복제본(HomeEventTest, HomeStateTest)을 만들어서
사용해줘야합니다.

테스트 환경에서는 createContainer()를 통해 ProviderContainer를 생성해주기 때문에 HomeEventTest내에서는 WidgetRef가 아닌 ProviderContainer를 주입해줘야
테스트가 가능합니다.
또한 State에 접근하기 위해서는 watch()를 통해 접근하는 것이 아닌 read()를 통해 접근이 가능합니다.

위 2가지 사항을 준수하여 테스트를 진행하면 됩니다.
