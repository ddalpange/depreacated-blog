title: RxJS란 ?
author: ddalpange
date: 2018-06-03 16:15:21
tags:
---
## 1. Reactive X ?

> ReactiveX is a library for composing asynchronous and event-based programs by using observable sequences.
It extends the observer pattern to support sequences of data and/or events and adds operators that allow you to compose sequences together declaratively while abstracting away concerns about things like low-level threading, synchronization, thread-safety, concurrent data structures, and non-blocking I/O.

[Reactive X](http://reactivex.io/)는 쉽게 요약하자면 비동기와 이벤트 기반의 프로그램에서 observable 패턴을 사용하기 위한 라이브러리입니다.


## 2. RxJS ?

Reactive X를 Javascript에서 구현하기 위한 라이브러리입니다.
대표적으로 Angular 프레임웍에선 내장 Http 라이브러리를 RxJS를 사용하여 구현하였으며,
리액트의 데이터 관리 라이브러리 MobX 또한 RxJS의 개념을 차용했다고 볼 수 있습니다.
RxJS의 장점으로는 비동기, 동기 구분없이 시간, 데이터의 흐름에 따라 이벤트 또는 통신 처리를 일관되게 처리할 수 있으며 수 많은 operator를 기본으로 탑재하고 있어 잘만 이용을 하면 코드양이 줄어들고 명확해집니다.반면에 단점으로는 높은 러닝커브인데요. http://reactivex.io/documentation/ko/operators.html 이 링크를 보시면 알겠지만 operator의 숫자는 엄청나게 많습니다. 충분한 학습이 없이 실무를 진행하게 되면 오퍼레이터를 하나하나 전부 검색해야하는데 쉬운 operator도 있지만 뭐라는지 모르겠는 operator가 더 많습니다.

