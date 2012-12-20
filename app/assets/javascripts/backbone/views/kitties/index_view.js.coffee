BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.IndexView extends Backbone.View
  template: JST["backbone/templates/kitties/index"]

  initialize: () ->
    @options.kitties.bind('reset', @addAll)

  addAll: () =>
    @options.kitties.each(@addOne)

  addOne: (kitty) =>
    view = new BbLivePoll.Views.Kitties.KittyView({model : kitty})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(kitties: @options.kitties.toJSON() ))
    @addAll()

    return this
