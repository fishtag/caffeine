json.pages found_pages do |page|
  json.date page.created_at.strftime('%d %B %Y')
  json.title page.title
  json.link page_url(page).html_safe
  json.summary page.slug
end
