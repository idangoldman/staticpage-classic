import Modal from '/scripts/modal'
import Events from '/scripts/helpers/events'
import componentsData from '/components'

export default class Toolbar
  constructor: ->
    @element = document.querySelector('#toolbar')
    @componentControlButtons = @element.querySelectorAll('button:not(#export)')
    @element.addEventListener('click', @onClick)
    @element.addEventListener('change', @onChange)

    Events.on('selectComponent', @onSelectComponent)
    Events.on('unselectComponent', @onUnselectComponent)

  onClick: ({ target }) =>
    unless ['select', 'nav'].includes(target.tagName.toLowerCase())
      switch target.id
        when 'edit'      then @edit()
        when 'move_up'   then @move_up()
        when 'move_down' then @move_down()
        when 'export'    then @export()

  onChange: ({ target }) =>
    @create(target.value)
    target.selectedIndex = 0

  onSelectComponent: (componentPosition) =>
    for button in @componentControlButtons
      unless (componentPosition == 'first' && button.id == 'move_up') || (componentPosition == 'last' && button.id == 'move_down')
        button.removeAttribute('disabled')
      else
        button.setAttribute('disabled', true)

  onUnselectComponent: () =>
    for button in @componentControlButtons
      button.setAttribute('disabled', true)

  create: (componentKey) ->
    { name, message, placeholder, tagName } = componentsData[componentKey]

    new Modal({
      message,
      placeholder,
      title: "Add #{name} Component",
      buttonText: 'Save',
      onDone: (status, content) =>
        if status == "submit" && content.trim().length
          Events.emit('createComponent', { tagName, content })
    })

  edit: ->
    console.log 'editor_edit'
  move_up: ->
    console.log 'editor_move_up'
  move_down: ->
    console.log 'editor_move_down'
  export: ->
    console.log 'editor_export'
