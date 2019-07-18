import Modal from './modal'

export default class Editor
  @add: ->
    new Modal()
  @edit: ->
    console.log 'editor_edit'
  @move_up: ->
    console.log 'editor_move_up'
  @move_down: ->
    console.log 'editor_move_down'
  @export: ->
    console.log 'editor_export'
