import Toolbar from './scripts/toolbar'
import Page from './scripts/page'

load = ->
  new Toolbar()
  new Page()

document.addEventListener('DOMContentLoaded', load)
