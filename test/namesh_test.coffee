assert = require 'power-assert'
mocha = require 'mocha'
nock = require 'nock'
promise = require 'bluebird'

Namesh = require '../src/namesh'

describe 'Namesh', ->
  urlBase = 'http://tokyo-ame.jwa.or.jp'
  body = 'Amesh.setIndexList(["201510190110","201510190105","201510190100","201510190055","201510190050","201510190045","201510190040","201510190035","201510190030","201510190025","201510190020","201510190015","201510190010","201510190005","201510190000","201510182355","201510182350","201510182345","201510182340","201510182335","201510182330","201510182325","201510182320","201510182315","201510182310"]);'

  describe '#indices', ->
    beforeEach( ->
      nock(urlBase)
        .get '/scripts/mesh_index.js'
        .reply 200, body
    )

    it 'returns Array', ->
      Namesh.indices().then (value) ->
        assert Array.isArray(value)

    it 'returns list of indices', ->
      expected = [
          '201510190110','201510190105','201510190100','201510190055','201510190050','201510190045','201510190040',
          '201510190035','201510190030','201510190025','201510190020','201510190015','201510190010','201510190005',
          '201510190000','201510182355','201510182350','201510182345','201510182340','201510182335','201510182330',
          '201510182325','201510182320','201510182315','201510182310'
      ]

      Namesh.indices().then (value) ->
        value.forEach (element, index, _) ->
          assert element == expected[index]
