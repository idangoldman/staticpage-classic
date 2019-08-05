import Events from '/scripts/helpers/events'
import Component from '/scripts/helpers/component'

export default class Page
  constructor: ->
    @currentComponent = new Component()

    @element = document.querySelector('#page')
    @element.addEventListener('click', @onClick)

    Events.on('createComponent', @onCreateComponent)

  onClick: ({ target }) =>
    unless target == @element
      @currentComponent.update(target)
      Events.emit('selectComponent', @currentComponent.getPosition())
    else
      @currentComponent.clear()
      Events.emit('unselectComponent')

  onCreateComponent: ({ tagName, content }) =>
    @currentComponent.create(tagName, content)
    @element.appendChild(@currentComponent.element)