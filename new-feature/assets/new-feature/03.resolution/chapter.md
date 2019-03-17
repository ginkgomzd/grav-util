---
title: Resolution
taxonomy:
  category:
    - docs
  tag:
    - content
    - feature
    - resolution
routes:
  canonical: /features/{{NAME}}/resolution
content:
    items: '@self.children'
    limit: 0
    pagination: true
process:
    twig: true
page-toc:
    active: false
---
# Resolution

{% for p in page.collection %}
### [{{ p.title }}]({{ p.url }})
{{ p.summary|striptags|safe_truncate(300) }}
{% endfor %}

[What is a Project Lab Feature Resolution?](https://docs.ginkgo.st/~docs/grav/manifest/features/feature/resolution)
