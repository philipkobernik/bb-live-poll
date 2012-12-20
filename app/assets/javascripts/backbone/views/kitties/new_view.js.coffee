BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.NewView extends Backbone.View
  template: JST["backbone/templates/kitties/new"]

  events:
    "submit #new-kitty": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (kitty) =>
        @model = kitty
        window.location.hash = "/#{@model.id}"

      error: (kitty, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
