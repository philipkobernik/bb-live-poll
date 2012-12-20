BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.KittyView extends Backbone.View
  initialize: ->
    @model.on 'change', @onChange, @
    @model.on 'remove', @onRemove, @
  template: JST["backbone/templates/kitties/kitty"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  className: "kitty"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @setStyle()
    return this

  setStyle: ->
    red = Math.round(Math.random() * 254 + 1)
    green = Math.round(Math.random() * 254 + 1)
    blue = Math.round(Math.random() * 254 + 1)
    color = "rgb(#{red},#{green},#{blue})"
    reverse = "rgb(#{(255 - red)},#{(255 - green)},#{(255 - blue)})"
    @$el.css('background-color', color)
    @$el.css('color', reverse)

  onChange: (model, options)->
    @render()

  onRemove: (model, collection, options)->
    @remove()
