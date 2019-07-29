import Events from '/scripts/helpers/events'
import Component from '/scripts/helpers/component'

export default class Page
  constructor: ->
    @currentComponent = null
    @element = document.querySelector('#page')
    @element.addEventListener('click', @onClick)

    Events.on('createComponent', @onCreateComponent)

  onClick: ({ target }) =>
    className = 'current'

    unless @currentComponent
      @currentComponent = target

    unless target == @element
      @currentComponent.classList.remove(className)
      target.classList.add(className)
      @currentComponent = target
    else
      @currentComponent.classList.remove(className)
      @currentComponent = null

  onCreateComponent: ({ tagName, content }) =>
    @currentComponent = new Component(tagName, content)
    @element.appendChild(@currentComponent)