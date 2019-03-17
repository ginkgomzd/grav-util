---
title: Context
taxonomy:
  category:
    - docs
  tag:
    - content
    - feature
    - context
routes:
  canonical: /features/{{NAME}}/context
content:
    items: '@self.children'
    limit: 0
    pagination: true
process:
    twig: true
page-toc:
    active: false
---
# Context

{% for p in page.collection %}
### [{{ p.title }}]({{ p.url }})
{{ p.summary|striptags|safe_truncate(300) }}
{% endfor %}

[What is a Project Lab Feature Context?](https://docs.ginkgo.st/~docs/grav/manifest/features/feature/context)
