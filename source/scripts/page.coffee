import Events from '/scripts/helpers/events'
import Component from '/scripts/helpers/component'

export default class Page
  constructor: ->
    @currentComponent = null
    @element = document.querySelector('#page')
    @element.addEventListener('click', @onClick)

    Events.on('createComponent', @onCreateComponent)

  onClick: ({ target }) =>
    unless @element == target
      target.classList.toggle('current')

  onCreateComponent: ({ tagName, content }) =>
    @currentComponent = new Component(tagName, content)
    @element.appendChild(@currentComponent)