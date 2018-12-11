---
title: Hexo에서 Code Copy (Clipboard) 버튼 만들기
thumbnail: https://zenorocha.github.io/clipboard.js/assets/images/facebook.png
tags: [hexo, clipboardJS]
date: 2018-11-21 18:39:55
categories:
- hexo
---

[Highlight](https://highlightjs.org/)는 [Prism](https://prismjs.com/index.html)과 달리 Code Copy 플러그인이 없어서 [Clipboard](https://clipboardjs.com/)로 직접 만들었다.

생각해보니 그냥 [Highlight](https://highlightjs.org/)를 [Prism](https://prismjs.com/index.html)으로 교체하는게 빠른듯.

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

        .hljs .clipboard-btn {
            float: right;
            color: #9a9a9a;
            background: none;
            border: none;
        }

        .hljs > .clipboard-btn {
            display: none;
            position: absolute;
            right: 4px;
            top: 4px;
        }

        .hljs:hover > .clipboard-btn {
            display: inline;
        }

        .hljs > figcaption > .clipboard-btn {
            margin-right: 4px;
        }
    </style>
    <script>
      $(document).ready(function () {
        $('figure.hljs').each(function(i, figure) {
          var codeId = 'code-' + i;
          var code = figure.querySelector('.code');
          var copyButton = $('<button>Copy <i class="far fa-clipboard"></i></button>');
          code.id = codeId;
          copyButton.addClass('clipboard-btn');
          copyButton.attr('data-clipboard-target-id', codeId);

          var figcaption = figure.querySelector('figcaption');

          if (figcaption) {
            figcaption.append(copyButton[0]);
          } else {
            figure.prepend(copyButton[0]);
          }
        })

        var clipboard = new ClipboardJS('.clipboard-btn', {
          target: function(trigger) {
            return document.getElementById(trigger.getAttribute('data-clipboard-target-id'));
          }
        });
      })
    </script>
<% } %>
```

```yml _config.yml
plugins:
	clipboard: true
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTAyMDkxOTI5LDExNjYzMDE3MzYsLTY4Mj
MzODUxNSwtMTAxNjI1NTU5MywtMTkxNTE3NjgxNV19
-->