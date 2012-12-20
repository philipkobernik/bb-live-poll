BbLivePoll.Views.Kitties ||= {}

class BbLivePoll.Views.Kitties.IndexView extends Backbone.View
  template: JST["backbone/templates/kitties/index"]

  initialize: () ->
    @options.kitties.bind('reset', @addAll)
    @options.kitties.bind('add', @addOne)

    # fetch the kitties collection every 3 seconds.
    # update:true enables intelligent collection updating.
    # http://backbonejs.org/#Collection-update
    setInterval ( =>@options.kitties.fetch({update:true}) ), 3000

  addAll: () =>
    @removeAll()
    @options.kitties.each(@addOne)

  removeAll: ->
    @$('tr.kitty').remove()

  addOne: (kitty) =>
    view = new BbLivePoll.Views.Kitties.KittyView({model : kitty})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(kitties: @options.kitties.toJSON() ))
    @addAll()

    return this
