import Modal from './modal'

export default class Editor
  @add: (componentName) ->
    new Modal({
      title: "Add #{componentName} Component",
      content: '',
      button_text: 'Save'
    })
  @edit: ->
    console.log 'editor_edit'
  @move_up: ->
    console.log 'editor_move_up'
  @move_down: ->
    console.log 'editor_move_down'
  @export: ->
    console.log 'editor_export'
