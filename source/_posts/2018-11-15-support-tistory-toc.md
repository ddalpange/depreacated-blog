---
title: 티스토리에서 TOC 지원하기
tags: []
categories:
  - null
date: 2018-11-15 15:33:54
thumbnail: https://t1.daumcdn.net/cfile/tistory/23711A3856372C9617
banner:
---

## TOC


Table Of Contents 의 줄임말.

"목차" 정도로 해석하면 될것같다.

<!-- more -->

### 만들기!

markedJS에서 렌더러를 통해 마크다운을 엘리먼트로 변환하는 중간 과정에 hook을 걸 수 있다.
h1 ~ h6 엘리먼트에 훅을 걸고 본문의 맨 앞에 TOC를 삽입하면 된다.

### 코드



```javascript

var toc = [];
var article = $(".tt_article_useless_p_margin");

prepareTOC(toc);
convert(article);
insertTOC(article, toc);

function insertTOC (article, toc) {
  var result = "목차\n========\n";
  var firstLebel = toc[0] ? toc[0].level : 1;

  for(var i = 0; i < toc.length; i++) {
    var link = toc[i];
    var tabs = "";

    for(var j = firstLebel; j < link.level; j++) {
      tabs += "\t";
    }

    tabs += "*";
    result += tabs + " ["+ link.text + "](#" + link.anchor + ")\n";
  }
  
  result += "\n\n"
    
   if (toc.length > 2) {
     article.prepend(marked(result));	
   }
}



function convert(article) {

  article[0].className += " markdown-body";
  
  var childs = article.children();
  var results = [];

  for(var i = 0; i < childs.length; i++) {

    var child = childs[i];
    if (child.tagName === "P") {
      if (child.children[0] && child.children[0].tagName === "BR") {
        results.push("");
      } else {
        results.push(child.innerText)
      }
    } else {
      results.push(child);
    }

    child.remove();
  }

  var string = "";

  for (var i = 0; i < results.length; i++) {
    var result = results[i];
    if (typeof result === "string") {
      string += result + "\n";
    } else {
      article.append(marked(string));
      string = "";
      article.append(result);
    }
  }

  if (string) {
    article.append(marked(string));
  }
}



function prepareTOC(toc) {

  var renderer = new marked.Renderer();

  renderer.heading = function(text, level, raw) {
    var anchor = Math.random() * 100
    toc.push({
      anchor: anchor,
      level: level,
      text: text
    });
    return '<h'
      + level
      + ' id="'
      + anchor
      + '">'
      + text
      + '</h'
      + level
      + '>\n';
  };

  marked.setOptions({
    renderer: renderer
  });
}

```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI5MjI1OTIzN119
-->