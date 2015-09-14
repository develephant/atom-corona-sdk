CoronaSdkEngine = require './coronasdk-engine'
{CompositeDisposable} = require 'atom'

module.exports = CoronaSdk =
  coronaSdkEngine: null
  subscriptions: null

  activate: (state) ->
    # Kit create module
    @coronaSdkEngine = new CoronaSdkEngine()

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'coronasdk:start': => @start()

  deactivate: ->
    @subscriptions.dispose()
    @coronaSdkEngine.destroy()

  start: ->
    @coronaSdkEngine.start()
