export default class Component
  @urlPatternTest: (url) ->
    /^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/.test(url)
  @splitNewLines: (content) ->
    content.split(/\r?\n/)

  constructor: (tagName, content) ->
    switch tagName
      when 'h1'     then return Component.Text(tagName, content)
      when 'p'      then return Component.Text(tagName, content)
      when 'ul'     then return Component.List(tagName, content)
      when 'img'    then return Component.Image(content)
      when 'a'      then return Component.Link(content)
      when 'iframe' then return Component.Iframe(content)
      else return null

  @Text: (tagName, content) ->
    tag = document.createElement(tagName)
    text = document.createTextNode(content)

    tag.appendChild(text)
    tag

  @List: (tagName, content) ->
    tag = document.createElement(tagName)

    for line in Component.splitNewLines(content)
      tagChild = document.createElement('li')
      text = document.createTextNode(line)

      tagChild.appendChild(text)
      tag.appendChild(tagChild)
    tag

  @Image: (content) ->
    if Component.urlPatternTest(content)
      tag = document.createElement('img')

      tag.setAttribute('src', content)
      tag

  @Link: (content) ->
    [ text, url ] = Component.splitNewLines(content)

    if text and Component.urlPatternTest(url)
      tag = document.createElement('a')
      text = document.createTextNode(text)

      tag.setAttribute('href', url)
      tag.appendChild(text)
      tag

  @Iframe: (content) ->
    if Component.urlPatternTest(content)
      tag = document.createElement('iframe')

      tag.setAttribute('src', content)
      tag.setAttribute('width', '80%')
      tag
