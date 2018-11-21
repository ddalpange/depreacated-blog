---
title: Rxjs 구독을 취소하는 여러가지 방법
tags: [rxjs, unsubscribe, stream]
categories:
date: 2018-11-21 18:39:55
---

**Angular**는 기본적으로 **RxJS**를 사용합니다.
**RxJS**를 사용할때 스트림을 연 컴포넌트가 없어진다 해도 열린 스트림은 닫히지 않기 때문에 메모리를 계속 먹습니다. 그렇기 때문에 **Unsubscribe**를 호출하여 스트림을 닫아주어야하는데요.

매번 


<!--stackedit_data:
eyJoaXN0b3J5IjpbMjgwMzM2OTU1LC0xNzMzOTYwNzBdfQ==
-->