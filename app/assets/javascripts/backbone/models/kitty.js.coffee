class BbLivePoll.Models.Kitty extends Backbone.Model
  paramRoot: 'kitty'

  defaults:
    name: null
    lives: null

class BbLivePoll.Collections.KittiesCollection extends Backbone.Collection
  model: BbLivePoll.Models.Kitty
  url: '/kitties'
