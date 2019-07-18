export default class Modal
  @template: (options) ->
    """
      <div id="#{options.id}" class="modal">
        <form method="" action="">
          <h1>#{options.title}</h1>
          <textarea>#{options.content}</textarea>
          <button type="submit">#{options.button_text}</button>
          <button type="reset">Cancel</button>
        </form>
      </div>
    """

  constructor: (options) ->
    @options = Object.assign({
      id: "modal-#{(new Date()).getTime()}",
      title: '',
      content: '',
      button_text: 'Save'
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
    switch event.target.type
      when 'submit' then
      when 'reset'  then @close()
