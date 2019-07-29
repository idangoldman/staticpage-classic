class Events
  constructor: ->
    unless @list
      @list = new Map()

  on: (name, fn) ->
    unless @list.has(name)
      @list.set(name, new Set())

    @list.get(name).add(fn)

  emit: (name, data) ->
    if @list.has(name)
      @list.get(name).forEach((fn) -> fn(data))

export default new Events()
