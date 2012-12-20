class BbLivePoll.Routers.KittiesRouter extends Backbone.Router
  initialize: (options) ->
    @kitties = new BbLivePoll.Collections.KittiesCollection()
    @kitties.reset options.kitties

  routes:
    "new"      : "newKitty"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newKitty: ->
    @view = new BbLivePoll.Views.Kitties.NewView(collection: @kitties)
    $("#kitties").html(@view.render().el)

  index: ->
    @view = new BbLivePoll.Views.Kitties.IndexView(kitties: @kitties)
    $("#kitties").html(@view.render().el)

  show: (id) ->
    kitty = @kitties.get(id)

    @view = new BbLivePoll.Views.Kitties.ShowView(model: kitty)
    $("#kitties").html(@view.render().el)

  edit: (id) ->
    kitty = @kitties.get(id)

    @view = new BbLivePoll.Views.Kitties.EditView(model: kitty)
    $("#kitties").html(@view.render().el)
