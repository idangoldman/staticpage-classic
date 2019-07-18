export default class Modal
  @template: (id = 'modal-', title = 'Add Component', content = '', button_type = 'submit', button_text = 'Save') ->
    """
      <div id="#{id}" class="modal">
        <article>
          <h1>#{title}</h1>
          <textarea>#{content}</textarea>
          <button type="#{button_type}">#{button_text}</button>
          <button type="reset">Cancel</button>
        </article>
      </div>
    """

  constructor: ->
    @modalId = "modal-#{(new Date()).getTime()}"
    @element = null

    @open()

  open: () ->
    document.body.insertAdjacentHTML('beforeend', Modal.template(@modalId))
    @element = document.querySelector("##{@modalId}")
    @element.classList.add('open')
    @element.addEventListener("click", @actions)

  close: () ->
    @element.classList.remove('open')
    @element.removeEventListener("click", @actions)
    @element.remove();

  actions: (event) =>
    switch event.target.type
      when 'submit' then
      when 'button' then
      when 'reset'  then @close()
