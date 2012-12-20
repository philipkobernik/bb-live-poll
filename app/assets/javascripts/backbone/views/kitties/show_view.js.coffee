BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.ShowView extends Backbone.View
  template: JST["backbone/templates/kitties/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
