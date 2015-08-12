json.pages found_pages do |page|
  json.date page.created_at.strftime('%d.%m.%Y')
  json.title page.title
  json.link edit_admin_page_url(page).html_safe
  json.summary page.summary
end
