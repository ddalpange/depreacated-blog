---
title: Hexo에서 Code Copy (Clipboard) 버튼 만들기
thumbnail: https://zenorocha.github.io/clipboard.js/assets/images/facebook.png
tags: [hexo, clipboardJS]
categories: hexo
date: 2018-11-21 18:39:55
---

**HighlightJS**는 **PrismJS**와 달리 Code Copy 플러그인이 없어서 **ClipboardJS**로 직접 만들었다.

생각해보니 그냥 **HighlightJS**를 **PrismJS**로 교체하는게 빠른듯.

<!-- more -->



위 파일의 내용을 **themes/__YOUR_THEME__/layout/plugins** 폴더에 넣어준 후 `_config.yml`을 아래와 같이 변경한다

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

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkwMDAwMDg5NywtMTkxNTE3NjgxNV19
-->