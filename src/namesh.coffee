promise = require 'bluebird'
request = require 'request'

INDICES_URL = 'http://tokyo-ame.jwa.or.jp/scripts/mesh_index.js'

Namesh = {}
Namesh.indices = (callback) ->
  getIndices = new promise (resolve, reject) ->
    request(INDICES_URL, (error, response, body) ->
      if !error && response.statusCode == 200
        resolve body.replace('Amesh.setIndexList([', '').replace(']);', '').replace(/"/g, '').split(',')
      else
        reject error
    )

module.exports = Namesh
