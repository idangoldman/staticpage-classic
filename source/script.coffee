import Editor from './scripts/editor'

buttonClick = (event) ->
  element = event.target

  unless ['select', 'nav'].includes(element.tagName.toLowerCase())
    switch element.id
      when 'edit'      then Editor.edit()
      when 'move_up'   then Editor.move_up()
      when 'move_down' then Editor.move_down()
      when 'export'    then Editor.export()

changeClick = (event) ->
  Editor.add(event.target.value)

load = ->
  toolbarElement = document.querySelector('#toolbar')
  toolbarElement.addEventListener('click', buttonClick)
  toolbarElement.addEventListener('change', changeClick)

document.addEventListener 'DOMContentLoaded', load
