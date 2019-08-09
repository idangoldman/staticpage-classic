import Element from '/scripts/helpers/element'

export default class Component
  constructor: () ->
    @className = 'current'
    @element = null

  create: (tagName, content) ->
    @element = new Element(tagName, content)

  change: (element) ->
    if @element
      @element.classList.remove(@className)

    @element = element
    @element.classList.add(@className)

  clear: () ->
    @element.classList.remove(@className)
    @element = null

  move: (direction = 'up') ->
    if direction == 'up'
      siblingElement = @element.previousElementSibling
    else
      siblingElement = @element.nextElementSibling.nextElementSibling

    @element.parentElement.insertBefore(@element, siblingElement)

  getPosition: () ->
    parentArray = Array.prototype.slice.call(@element.parentNode.children)
    elementIndex = parentArray.indexOf(@element)

    if elementIndex == 0
      position = 'first'
    else if elementIndex + 1 == parentArray.length
      position = 'last'
    else
      position = 'middle'
