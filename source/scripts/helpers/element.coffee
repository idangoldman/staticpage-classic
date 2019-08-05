export default class Element
  @urlPatternTest: (url) ->
    /^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/.test(url)
  @splitNewLines: (content) ->
    content.split(/\r?\n/)

  constructor: (tagName, content) ->
    switch tagName
      when 'h1'     then return Element.Text(tagName, content)
      when 'p'      then return Element.Text(tagName, content)
      when 'ul'     then return Element.List(tagName, content)
      when 'img'    then return Element.Image(content)
      when 'a'      then return Element.Link(content)
      when 'iframe' then return Element.Iframe(content)
      else return null

  @Text: (tagName, content) ->
    tag = document.createElement(tagName)
    text = document.createTextNode(content)

    tag.appendChild(text)
    tag

  @List: (tagName, content) ->
    tag = document.createElement(tagName)

    for line in Element.splitNewLines(content)
      tagChild = document.createElement('li')
      text = document.createTextNode(line)

      tagChild.appendChild(text)
      tag.appendChild(tagChild)
    tag

  @Image: (content) ->
    if Element.urlPatternTest(content)
      tag = document.createElement('img')

      tag.setAttribute('src', content)
      tag

  @Link: (content) ->
    [ text, url ] = Element.splitNewLines(content)

    if text and Element.urlPatternTest(url)
      tag = document.createElement('a')
      text = document.createTextNode(text)

      tag.setAttribute('href', url)
      tag.appendChild(text)
      tag

  @Iframe: (content) ->
    if Element.urlPatternTest(content)
      tag = document.createElement('iframe')

      tag.setAttribute('src', content)
      tag.setAttribute('width', '80%')
      tag
