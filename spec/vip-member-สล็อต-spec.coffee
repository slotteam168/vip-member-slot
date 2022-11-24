VipMember-สล็อต = require '../lib/vip-member-สล็อต'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "VipMember-สล็อต", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('vip-member-สล็อต')

  describe "when the vip-member-สล็อต:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.vip-member-สล็อต')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'vip-member-สล็อต:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.vip-member-สล็อต')).toExist()

        vipMember-สล็อตElement = workspaceElement.querySelector('.vip-member-สล็อต')
        expect(vipMember-สล็อตElement).toExist()

        vipMember-สล็อตPanel = atom.workspace.panelForItem(vipMember-สล็อตElement)
        expect(vipMember-สล็อตPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'vip-member-สล็อต:toggle'
        expect(vipMember-สล็อตPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.vip-member-สล็อต')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'vip-member-สล็อต:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        vipMember-สล็อตElement = workspaceElement.querySelector('.vip-member-สล็อต')
        expect(vipMember-สล็อตElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'vip-member-สล็อต:toggle'
        expect(vipMember-สล็อตElement).not.toBeVisible()
