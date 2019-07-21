export default class Modal
  @template: (options) ->
    """
      <div id="#{options.id}" class="modal">
        <form method="" action="">
          <h1>#{options.title}</h1>
          <p>#{options.message}</p>
          <textarea>#{options.content}</textarea>
          <button type="submit">#{options.buttonText}</button>
          <button type="reset">Cancel</button>
        </form>
      </div>
    """

  constructor: (options) ->
    @options = Object.assign({
      id: "modal-#{(new Date()).getTime()}",
      title: '',
      content: '',
      message: '',
      buttonText: 'Save',
      onDone: ->
    }, options);

    @element = null
    @open()

  open: () ->
    document.body.insertAdjacentHTML('beforeend', Modal.template(@options))
    @element = document.querySelector("##{@options.id}")
    @element.classList.add('open')
    @element.addEventListener("click", @actions)

  close: () ->
    @element.classList.remove('open')
    @element.removeEventListener("click", @actions)
    @element.remove();

  actions: ({ target }) =>
    if ['submit', 'reset'].includes(target.type)
      switch target.type
        when 'submit' then @options.onDone('submit', @element.querySelector('textarea').value)
        when 'reset'  then @options.onDone('cancel')

      event.preventDefault()
      @close()
