import Element from '/scripts/helpers/element'

export default class Component

  constructor: () ->
    @className = 'current'
    @element = null

  create: (tagName, content) ->
    @element = new Element(tagName, content)

  update: (element) ->
    if @element
      @element.classList.remove(@className)

    @element = element
    @element.classList.add(@className)

  clear: () ->
    if @element
      @element.classList.remove(@className)
      @element = null