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

  getPosition: () ->
    if @element
      parentArray = Array.prototype.slice.call(@element.parentNode.children)
      elementIndex = parentArray.indexOf(@element)

      if elementIndex == 0
        position = 'first'
      else if elementIndex + 1 == parentArray.length
        position = 'last'
      else
        position = 'middle'
