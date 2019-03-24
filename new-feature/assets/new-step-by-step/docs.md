---
title: {{TITLE}}
taxonomy:
  category:
    - docs
  tag:
    - content
    - guide
routes:
  canonical: /guides/{{NAME}}
content:
    items: '@self.children'
    limit: 0
    pagination: true
process:
    twig: true
page-toc:
    active: false
---
# {{TITLE}}

{% for p in page.collection %}
### [{{ p.title }}]({{ p.url }})
{{ p.summary|striptags|safe_truncate(300) }}
{% endfor %}

