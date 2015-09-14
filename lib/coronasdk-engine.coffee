path = require("path")
clone = require("nodegit").Clone.clone

module.exports =
class CoronaKitCreate
  
  constructor: (serializedState) ->
        
  serialize: ->
    
  destroy: ->
    
  start: ->
    @getTree()
  
  getTree: () ->
    cloneOptions =
      remoteCallbacks:
        certificateCheck: ->
          1

    localPath = path.join __dirname, "tmp"
    clone("https://github.com/develephant/corona-sdk-starter.git", localPath, cloneOptions).then ((repo) ->
      console.log('repo')
    ), ((err) ->
      console.log(err)
    )
