import Events from '/scripts/helpers/events'

export default class Page
  @urlPatternTest: (url) ->
    /^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/.test(url)
  @splitNewLines: (content) ->
    content.split(/\r?\n/)

  constructor: ->
    @element = document.querySelector('#page')
    Events.on('createComponent', @onCreateComponent)

  onCreateComponent: ({ tag, content }) =>
    switch tag
      when 'h1'     then @createTextComponent(tag, content)
      when 'p'      then @createTextComponent(tag, content)
      when 'ul'     then @createListComponent(tag, content)
      when 'img'    then @createImageComponent(content)
      when 'a'      then @createLinkComponent(content)
      when 'iframe' then @createIframeComponent(content)

  createTextComponent: (tag, content) ->
    tag = document.createElement(tag)
    text = document.createTextNode(content)

    tag.appendChild(text)
    @element.appendChild(tag)

  createListComponent: (tag, content) ->
    tag = document.createElement(tag)

    for line in Page.splitNewLines(content)
      tagChild = document.createElement('li')
      text = document.createTextNode(line)

      tagChild.appendChild(text)
      tag.appendChild(tagChild)

    @element.appendChild(tag)

  createImageComponent: (content) ->
    if Page.urlPatternTest(content)
      tag = document.createElement('img')
      tag.setAttribute('src', content)

      @element.appendChild(tag)

  createLinkComponent: (content) ->
    [ text, url ] = Page.splitNewLines(content)

    if text and Page.urlPatternTest(url)
      tag = document.createElement('a')
      text = document.createTextNode(text)
      tag.setAttribute('href', url)
      tag.appendChild(text)

      @element.appendChild(tag)

  createIframeComponent: (content) ->
    if Page.urlPatternTest(content)
      tag = document.createElement('iframe')
      tag.setAttribute('src', content)
      tag.setAttribute('width', '80%')

      @element.appendChild(tag)
