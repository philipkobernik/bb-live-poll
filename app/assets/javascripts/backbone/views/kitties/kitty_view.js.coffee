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
    return this

  onChange: (model, options)->
    @render()

  onRemove: (model, collection, options)->
    @remove()
