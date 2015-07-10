Caffeine::AdminUser.create(email: 'admin@example.com', password: 'q1w2e3')

Caffeine::Page.create(title: 'main', position: 0, data: {content: '', summary: '', serve_by_slug_only: 0}, main: true)
Caffeine::Page.create(title: 'parent', position: 1, data: {content: '', summary: '', serve_by_slug_only: 0}, main: true)
Caffeine::Page.create(title: 'child', position: 2, data: {content: '', summary: '', serve_by_slug_only: 0}, main: true)
