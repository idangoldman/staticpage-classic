import Modal from './modal'

export default class Editor
  @add: (componentName) ->
    new Modal({
      title: "Add #{componentName} Component",
      buttonText: 'Save',
      onDone: Editor.onModalDone
    })
  @edit: ->
    console.log 'editor_edit'
  @move_up: ->
    console.log 'editor_move_up'
  @move_down: ->
    console.log 'editor_move_down'
  @export: ->
    console.log 'editor_export'

  @onModalDone: (status, content) ->
    console.log status, content
