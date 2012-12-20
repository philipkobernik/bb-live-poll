BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.KittyView extends Backbone.View
  template: JST["backbone/templates/kitties/kitty"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
