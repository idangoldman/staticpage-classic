import Modal from './modal'
import Events from './events'
import componentsData from '../components'

export default class Toolbar
  constructor: ->
    @currentComponent = { id: null, name: null, content: null }
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
    @create(target.value)
    target.selectedIndex = 0

  onCreateModalDone: (status, content) =>
    if status == "submit" && content.trim().length
      Events.emit('createComponent', { ...@currentComponent, content })

    @resetCurrentComponent()

  resetCurrentComponent: ->
    @currentComponent = {
      id: null, tag: null, content: null
    }

  create: (componentKey) ->
    { name, message, placeholder, tag } = componentsData[componentKey]
    @currentComponent = { id: null, tag }

    new Modal({
      message, placeholder,

      title: "Add #{name} Component",
      buttonText: 'Save',
      onDone: @onCreateModalDone
    })
  edit: ->
    console.log 'editor_edit'
  move_up: ->
    console.log 'editor_move_up'
  move_down: ->
    console.log 'editor_move_down'
  export: ->
    console.log 'editor_export'
