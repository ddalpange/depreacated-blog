---
title: 자바스크립트 3점 표기법
tags: ['ES2015', 'ES6', 'threeDots', 'rest', 'spread']
categories:
  - javascript
  - es2015
date: 2018-01-11 14:21:32
thumbnail: https://pbs.twimg.com/profile_images/821080734102220800/PANTqUmu.jpg
---

자바스크립트는 자바나 다른 정적 언어에 비해 정의되거나 정해진게 많지 않아 어려운 반면이 없지않아 있습니다.

각자 프로그래밍에 대한 생각이 다르다 보니 코딩 스타일도 다르기 때문인데요.

다른 사람들의 소스코드를 읽을때마다 가끔씩 괴랄한 문법이 튀어나오는데 당황하지말고 정리해봅시다.

리액트를 쓰시다 보면 아래와 같이 수상한(?) 문법을 보셨을때가 있었을 겁니다.

<!-- more -->

```jsx
import React from 'react';

export class BlueButton extends React.component {
	static props = {
		className: '',
		name: '저장',
		onClick: () => {}
	}
	
	render() {
		let { className, ...props } = this.props;
		
		return <button className={`btn btn-info ${className}`} {...props} />		
	}
	
}
```
사실 위의 *...*표기법은 ES6에서 제안된 문법인데요. Rest Operator와 Spread Operator로 나뉩니다. 한번 알아보도록 하죠
 
## Rest Operator

Rest Operator를 알아보기 전에 리터럴 문법을 먼저 알아볼 필요가 있습니다.

```js
const object = {a: 1, b: 2 , c: 3};
const {a, b} = object;
console.log(a, b); // 1, 2

const array = [1,2,3,4,5];
const [c, d] = array;
console.log(c, b); // 1, 2
```

위의 리터럴 문법대로 선언한다면 a,b와 c,d의값은 1, 2가 나올겁니다. 

하지만 프로퍼티가 많아져 점점 변수가 많아진다면 어떻게 해야할까요 ?

a,b,c,d,e,f,g 기하급수적으로 늘어난다면 해당 값의 변수를 계속해서 선언해주기엔 무리가 따릅니다.

그럴때 쓰는게 바로 Rest Opertor입니다.

```js
const object = {a: 1, b: 2 , c: 3};
const {a, b, ...objRest} = object;
console.log(a, b, objRest); // 1, 2 { c: 3 }

const array = [1,2,3,4,5];
const [c, d, ...arrayRest] = array;
console.log(c, b, arrayRest); // 1, 2
```

앞에 *...*를 명시하면 배열이라면 나머지 원소들을 배열로 만들어 리턴하고,

오브젝트라면 열거할수 있는 나머지 프로퍼티들을 묶어 오브젝트로 반환합니다.

## Spread Operator

Rest Opertor와 반대되는 의미라고 해석하면 될것같습니다.

앞에 *...*을 명시하면 배열이라면 원소들을 나열하고, 

오브젝트라면 열거할수 있는 프로퍼티들을 나열합니다.

```js
const a = [1,2,3];
const aa = [...a, ...a];
console.log(aa) // [1, 2, 3, 1, 2, 3]
```

```js
export interface Component {
	defaultProps = {}
    props = {};
    
    setValue = (props) => {
    	this.props = {...this.defaultProps, ...props};
    }	
}
```

```js
new Date(...[2018,01,01]);
```
오브젝트의 프로퍼티 나열할때 똑같은 프로퍼티가 있다면 뒤에 쓴걸로 덮어쓰기됩니다.

*여기서 의문!*
과연 Spread는 오브젝트를 딥카피할까요 ?

```js
let depth = {
	value: 0,
	oneDepth: {
		value: 1,
		twoDepth: {
        	value: 2
		}
	}	
};

let copiedDepth = { ...depth };
copiedDepth.value = -1;
copiedDepth.oneDepth.value = -1;
console.log(depth.value, depth.oneDepth.value);
```
딥카피인지 스왈로카피일지, 아니면 단순 참조일지는 한번 실행해보세요 !


## 정리
이제 예제를 다 이해 하셨으면 처음의 문제로 돌아가보죠.

```jsx
import React from 'react';

export class BlueButton extends React.component {
	static props = {
		className: '',
		name: '저장',
		onClick: () => {}
	}
	
	render() {
		let { className, ...props } = this.props;
		
		return <button className={`btn btn-info ${className}`} {...props} />		
	}
	
}
```
위 코드는 스프레드일까요 레스트일까요? 

`let { className, ...props } = this.props;` 

여기선 this.props에서 클래스네임을 따로 정의하고, 남은걸 props로 모았기 때문에 rest라 할 수 있습니다.

`return <button className={`btn btn-info ${className}`} {...props} />`

반대로 여기선 props의 남은 프로퍼티들을 열거했기 때문에 spread로 볼수 있겠죠 ?

틀렸거나 궁금한점이 있다면 댓글 부탁드립니다.