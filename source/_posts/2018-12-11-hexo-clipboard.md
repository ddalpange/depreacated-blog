---
title: Hexo에서 Code Copy (Clipboard) 버튼 만들기
thumbnail: https://zenorocha.github.io/clipboard.js/assets/images/facebook.png
tags: [hexo, clipboardJS]
date: 2018-11-21 18:39:55
categories:
- hexo
---

헥소 블로그 테마로 [Minos](https://github.com/ppoffice/hexo-theme-minos)를 사용하고 있다.

헥소는 기본적으로 [Highlight](https://highlightjs.org/)를 이용해서 코드를 하이라이팅한다.

[Highlight](https://highlightjs.org/)는 [Prism](https://prismjs.com/index.html)과 달리 Code Copy 플러그인이 없어서 [Clipboard](https://clipboardjs.com/)로 직접 만들었다.

해당 수정사항을 **Pull Request**로 보냈더니 승인해줬다. 오픈소스 활동 하나 더 늘었다 !!

생각해보니 그냥 [Highlight](https://highlightjs.org/)를 [Prism](https://prismjs.com/index.html)으로 교체하는게 빠른듯.

![Pull Request](https://ddalpange.github.io/images/minos-contribute.png)

<!-- more -->

## 사용법

* `clipboard.ejs`를 **themes/__YOUR_THEME__/layout/plugins**에 넣는다.
* `_config.yml`에서 `plugins.clipboard`에 `true`를 넣는다.

```ejs clipboard.ejs
<% if (!head && !(has_config('plugins.clipboard') && get_config('plugins.clipboard') === false)) { %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
    <style>
      .hljs {
        position: relative;
      }
      .hljs > .clipboard-btn {
        position: absolute;
        right: 4px;
        top: 4px;
        display: none;
        background: none;
        border: none;
      }
      .hljs:hover .clipboard-btn {
        display: inline;
      }
    </style>
    <script>
        $(document).ready(function () {
          $('figure.hljs').each(function(i, figure) {
            var code = figure.querySelector('.code');
            code.id = 'code-' + i;
            var copyButton = $('<button data-clipboard-target-id=' + code.id +'>Copy</button>');

            copyButton.css('float', 'right');
            copyButton.addClass('clipboard-btn');
            figure.prepend(copyButton[0])
          })

          var clipboard = new ClipboardJS('.clipboard-btn', {
            target: function(trigger) {
              return document.getElementById(trigger.getAttribute('data-clipboard-target-id'));
            }
          });

          clipboard.on('success', function(e) {
            $(e.trigger).text("Copied!");
            e.clearSelection();
            setTimeout(function() {
              $(e.trigger).text("Copy");
            }, 2500);
          });

          clipboard.on('error', function(e) {
            $(e.trigger).text("Can't in Safari");
            setTimeout(function() {
              $(e.trigger).text("Copy");
            }, 2500);
          });
        })
    </script>
<% } %>
```

```yml _config.yml
plugins:
	clipboard: true
```



