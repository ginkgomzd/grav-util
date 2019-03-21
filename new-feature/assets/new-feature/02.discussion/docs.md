---
title: Discussion
taxonomy:
  category:
    - docs
  tag:
    - content
    - feature
routes:
  canonical: /features/{{NAME}}/discussion
content:
    items: '@self.children'
    limit: 0
    pagination: true
process:
    twig: true
page-toc:
    active: false
---
# Discussion

{% for p in page.collection %}
### [{{ p.title }}]({{ p.url }})
{{ p.summary|striptags|safe_truncate(300) }}
{% endfor %}

[What is a Project Lab Feature Discussion?](https://docs.ginkgo.st/~docs/grav/manifest/features/feature/discussion)
