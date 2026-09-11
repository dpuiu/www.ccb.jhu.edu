-- Pandoc Lua filter for converting legacy HTML pages to GitHub Markdown


-- Check whether an element has a specific CSS class
local function has_class(el, class)
  return el.classes and el.classes:includes(class)
end


-- Remove unwanted containers
function Div(el)

  -- Remove navigation/header/footer/sidebar
  local remove_classes = {
    "md-sidebar",
    "md-header",
    "sidebar",
    "navigation",
    "navbar",
    "footer",
    "menu",
  }

  for _, class in ipairs(remove_classes) do
    if has_class(el, class) then
      return {}
    end
  end

  -- Keep main content only
  if el.identifier == "mainContent" then
    return el.content
  end

  return nil
end


-- Remove SSI directives and fix HTTP URLs in text
function Str(el)

  -- Remove SSI directives
  if el.text:match("^%s*<!--#") then
    return {}
  end

  el.text = el.text:gsub("http://", "https://")

  return el
end


-- Fix links and remove citation-style anchor links
function Link(el)

  -- Convert HTTP links to HTTPS
  el.target = el.target:gsub("^http://", "https://")

  local text = pandoc.utils.stringify(el.content)

  -- Remove backslash escaping
  text = text:gsub("\\", "")

  -- Convert [\[1\]](#1) -> [1]
  if text:match("^%[%d+%]$") and el.target:match("^#%d+$") then
    return pandoc.Str(text)
  end

  return el
end


-- Fix image URLs
function Image(el)

  el.src = el.src:gsub("^http://", "https://")

  return el
end


-- Remove raw HTML comments, scripts, and styles
function RawBlock(el)

  if el.format == "html" then
    if el.text:match("^%s*<!--")
       or el.text:match("<script")
       or el.text:match("</script>")
       or el.text:match("<style")
       or el.text:match("</style>")
    then
      return {}
    end
  end

  return nil
end


-- Remove raw HTML comments, scripts, and styles
function RawInline(el)

  if el.format == "html" then
    if el.text:match("^%s*<!--")
       or el.text:match("<script")
       or el.text:match("<style")
    then
      return {}
    end
  end

  return nil
end


-- Remove layout/navigation tables
function Table(el)

  local attr = el.attr

  if attr and attr.attributes then
    local class = attr.attributes["class"]

    if class and (class:match("layout") or class:match("nav")) then
      return {}
    end
  end

  return nil
end


-- Remove empty paragraphs
function Para(el)

  if #el.content == 0 then
    return {}
  end

  return nil
end


-- Remove empty spans and named anchors
function Span(el)

  -- Remove empty spans used as anchors
  if #el.content == 0 then
    return {}
  end

  -- Remove named anchors but keep their text
  if el.identifier ~= "" then
    return el.content
  end

  return nil
end
