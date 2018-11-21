---
title: Rxjs 구독을 취소하는 여러가지 방법
tags: [rxjs, unsubscribe, stream]
categories:
date: 2018-11-21 18:39:55
---

**Angular**는 기본적으로 **RxJS**를 사용합니다.
**RxJS**를 사용할때 스트림을 연 컴포넌트가 없어진다 해도 열린 스트림은 닫히지 않기 때문에 메모리를 계속 먹습니다. 그렇기 때문에 **Unsubscribe**를 호출하여 스트림을 닫아주어야하는데요.

매번 **Unsubscribe**를 하기는 너무나 귀찮음으로 스트림 구독을 해제할 수 있는 다양한 방법을 소개합니다.

참고로 **HttpClient**, **Router** 등 앵귤러 내부에서 제공하는 기능들은 따로 **Unsubscribe**를 하지 않아


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIxMDgyNDE0ODQsLTE3MzM5NjA3MF19
-->