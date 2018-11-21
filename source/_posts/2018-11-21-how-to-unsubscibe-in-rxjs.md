---
title: Rxjs 구독을 취소하는 여러가지 방법
tags: [rxjs, unsubscribe, stream]
categories:
date: 2018-11-21 18:39:55
---

**Angular**는 기본적으로 **RxJS**를 사용합니다.
**RxJS**를 사용할때 스트림을 연 컴포넌트가 없어진다 해도 열린 스트림은 닫히지 않기 때문에 메모리를 계속 먹습니다. 그렇기 때문에 **Unsubscribe**를 호출하여 스트림을 닫아주어야하는데요.

매번 **Unsubscribe**를 하기는 너무나 귀찮음으로 스트림 구독을 해제할 수 있는 다양한 방법을 소개합니다.

참고로 **HttpClient**, **Router** 등 앵귤러 내부에서 제공하는 기능들은 따로 **Unsubscribe**를 하지 않아도 자동으로 구독을 해제합니다.

## Async Pipe
```typescript some-component.ts
export class SomeComponent implements OnInit {
	list$: Observable<any>;
	ngOnInit() {
		this.list$ = this.api.getList();
	}
}
```
```html some-component.html
<ng-container *ngIf="list$ | async as list; else loadingTemplate">
    <app-table [list]="list" [keys]="keys"></app-table>
</ng-container>
```
**Angular** 에서 제공하는 **Async** pipe를 사용하는 방법입니다.
**Async** pipe가 알아서 Observable을 구독하고 해지하기 때문에 사용자는 별도로 신경써줄 필요가 없죠. 다만 이 방법은 두가지의 문제가 있습니다.

```typescript some-component.ts
export class SomeComponent implements OnInit {
	list$: Observable<any>;
	ngOnInit() {
		this.list$ = this.api.getList().pipe(
			tap(list => console.log(list))
		);
	}
}
```
첫번째로 스크립트내에서 데이터를 쓰기가 귀찮습니다. html에서 event를 통해서 받거나, 아니면 tap operator를 이용해 후킹하여 데이터를 저장해야합니다.

```html some-component.html
<section>
	<ng-container *ngIf="list$ | async as list; else loadingTemplate">
	    <app-table [list]="list" [keys]="keys"></app-table>
	</ng-container>
</section>
<footer class="another">
	<!-- Error -->
	<pre [innerHTML]="list | json"></pre>
</footer>
```
list를 선언한 안쪽이 아닌 바깥쪽에서는 list에 접근할 수가 없습니다.
async pipe를 여러번 사용하면 api 요청도 여러번 날라가기 때문에 미리 마크업 구조를 잡고 가야합니다.

## TakeUntill

## Take
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0NjY1ODI4MjgsLTE3MzM5NjA3MF19
-->