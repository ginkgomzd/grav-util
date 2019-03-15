---
title: Solution
taxonomy:
  category: 
    - docs
  tag:
    - content
    - feature
    - solution
routes:
  canonical: /features/{{name}}/solution
content:
    items: '@self.children'
    limit: 0
    pagination: true
process:
    twig: true
page-toc:
    active: false
---
# Solution

{% for p in page.collection %}
### [{{ p.title }}]({{ p.url }})
{{ p.summary|striptags|safe_truncate(300) }}
{% endfor %}

[What is a Project Lab Feature Solution?](https://docs.ginkgo.st/~docs/grav/manifest/features/feature/solution)