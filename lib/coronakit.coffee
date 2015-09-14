CoronaKitCreate = require './coronakit-create'
{CompositeDisposable} = require 'atom'

module.exports = Coronakit =
  coronaKitCreate: null
  subscriptions: null

  activate: (state) ->
    # Kit create module
    @coronaKitCreate = new CoronaKitCreate()

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'coronakit:create': => @create()

  deactivate: ->
    @subscriptions.dispose()

  create: ->
    @coronaKitCreate.start()
