path = require("path")
clone = require("nodegit").Clone.clone

module.exports =
class CoronaKitCreate
  
  constructor: (serializedState) ->
    console.log 'create'
        
  serialize: ->
    
  destroy: ->
    
  start: ->
    console.log 'started'
    @getTree()
  
  getTree: () ->
    console.log 'tree me'
    
    cloneOptions =
      remoteCallbacks:
        certificateCheck: ->
          1

    localPath = path.join __dirname, "tmp"
    clone("https://github.com/develephant/coronakit.git", localPath, cloneOptions).then ((repo) ->
      console.log('repo')
    ), ((err) ->
      console.log(err)
    )

  alertDone: ->
    
    # var localPath = require("path").join(__dirname, "tmp");
    # var cloneOptions = {};
    ### cloneOptions.remoteCallbacks = {
  certificateCheck: function() { return 1; }
}; ###
