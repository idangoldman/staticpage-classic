import Modal from './modal'

export default class Toolbar
  constructor: ->
    @element = document.querySelector('#toolbar')
    @element.addEventListener('click', @onClick)
    @element.addEventListener('change', @onChange)

  onClick: ({ target }) =>
    unless ['select', 'nav'].includes(target.tagName.toLowerCase())
      switch target.id
        when 'edit'      then @edit()
        when 'move_up'   then @move_up()
        when 'move_down' then @move_down()
        when 'export'    then @export()

  onChange: ({ target }) =>
    @add(target.value)
    target.selectedIndex = 0

  onModalDone: (status, content) =>
    console.log status, content

  add: (componentName) ->
    new Modal({
      title: "Add #{componentName} Component",
      buttonText: 'Save',
      onDone: @onModalDone
    })
  edit: ->
    console.log 'editor_edit'
  move_up: ->
    console.log 'editor_move_up'
  move_down: ->
    console.log 'editor_move_down'
  export: ->
    console.log 'editor_export'
