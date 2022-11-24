VipMember-สล็อตView = require './vip-member-สล็อต-view'
{CompositeDisposable} = require 'atom'

module.exports = VipMember-สล็อต =
  vipMember-สล็อตView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @vipMember-สล็อตView = new VipMember-สล็อตView(state.vipMember-สล็อตViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @vipMember-สล็อตView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'vip-member-สล็อต:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @vipMember-สล็อตView.destroy()

  serialize: ->
    vipMember-สล็อตViewState: @vipMember-สล็อตView.serialize()

  toggle: ->
    console.log 'VipMember-สล็อต was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
