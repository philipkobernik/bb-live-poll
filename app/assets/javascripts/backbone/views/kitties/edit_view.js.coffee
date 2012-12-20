BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.EditView extends Backbone.View
  template: JST["backbone/templates/kitties/edit"]

  events:
    "submit #edit-kitty": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (kitty) =>
        @model = kitty
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
