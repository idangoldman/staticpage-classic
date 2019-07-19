export default class Modal
  @template: (options) ->
    """
      <div id="#{options.id}" class="modal">
        <form method="" action="">
          <h1>#{options.title}</h1>
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

  actions: (event) =>
    if ['submit', 'reset'].includes(event.target.type)
      switch event.target.type
        when 'submit' then @options.onDone('submit', @element.querySelector('textarea').value)
        when 'reset'  then @options.onDone('cancel')

      event.preventDefault()
      @close()
