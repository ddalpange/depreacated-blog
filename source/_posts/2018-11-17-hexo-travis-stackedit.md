---
title: 블로그를 편하게 하기 위한 발악 (hexo, travis, stackedit)
tags: [hexo, travis, github, stackedit]
categories:
date: 2018-11-16 18:39:55
---

티스토리를 커스터마이징 하여 사용하다가 혈압이 올라서 다시 헥소로 포스팅을 하기로 했다.

티스토리는 자체 에디터를 사용하는데 html 결과물이 나오는 형태가 매우 복잡해서 마크다운으로 변환하기에 어려움이 있었다.

그래서 티스토리의 단점을 커버하기보다 헥소의 단점을 커버하는게 더 낫다고 생각하여 변경하였다.

헥소의 문제점은 두가지다.
1. `hexo deploy -g` 를 매번 해줘야한다.
2. 개발환경이 갖추어지지 않으면 포스팅을 할 수 없다.

그래서 이 두가지 문제를 해결하는 방안을 포스팅하려한다.

## 1. Travis CI를 사용하여 자동 빌드 및 푸쉬하기

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU3OTE4Mzg3Ml19
-->