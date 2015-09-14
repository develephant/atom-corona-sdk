CoronakitView = require './coronakit-view'
{CompositeDisposable} = require 'atom'

module.exports = Coronakit =
  coronakitView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @coronakitView = new CoronakitView(state.coronakitViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @coronakitView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'coronakit:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @coronakitView.destroy()

  serialize: ->
    coronakitViewState: @coronakitView.serialize()

  toggle: ->
    console.log 'Coronakit was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
