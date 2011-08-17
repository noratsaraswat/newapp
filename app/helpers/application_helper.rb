module ApplicationHelper
end
def link_button_to(name, options = {}, html_options = {})
    url = url_for(options)
    html_options["onclick"] = "javascript:document.location.href='#{url}'; return false;"
    html_options.merge!("type" => "button", "value" => name)
    tag("input", html_options)
end