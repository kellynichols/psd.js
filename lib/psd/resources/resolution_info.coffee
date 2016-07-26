RES_UNIT_NAMES = ['pixel/inch', 'pixel/cm']
UNIT_NAMES = ['in', 'cm', 'pt', 'picas', 'columns']

module.exports = class ResolutionInfo
  id: 1005
  name: 'resolutionInfo'

  constructor: (@resource) ->
    @file = @resource.file

  parse: ->
    @horzRes = @file.readUInt() / (1 << 16)
    @horzResUnit = @file.readUShort()
    @widthUnit = @file.readUShort()

    @vertRes = @file.readUInt() / (1 << 16)
    @vertResUnit = @file.readUShort()
    @heightUnit = @file.readUShort()

  export: ->
    horzRes: @horzRes
    horzResUnit: RES_UNIT_NAMES[@horzResUnit - 1] || 'undefined'
    widthUnit: UNIT_NAMES[@widthUnit - 1] || 'undefined'
    vertRes: @vertRes
    vertResUnit: RES_UNIT_NAMES[@vertResUnit - 1] || 'undefined'
    heightUnit: UNIT_NAMES[@heightUnit - 1] || 'undefined'
