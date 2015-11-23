console.log('richarea initialized')

class Richarea
  constructor : (@name = 'Rich Text Area Editor') ->
    @text = new ReactiveVar()
    @converter = new Showdown.converter() 
  
  setText : (t) -> @text.set t

  getText     : -> @text.get()   
  getHTML     : -> @converter.makeHtml @getText()

  # i dont know why markdown package needs 
  # a first blank line to render correctly
  getFakeText : -> "\n" + @text.get()   

Richarea = new Richarea()

Template.RichArea.onRendered ->
  Richarea.setText @find('textarea').value
  
Template.RichArea.helpers
  content : ->
    return Richarea.getFakeText()


Template.RichAreaPreview.helpers
  content : ->    
    return Richarea.getFakeText()

Template.RichAreaPreview.onRendered ->
  Richarea.setText @data.content if @data?.content

Template.RichArea.events
  'keyup textarea' : (e,t) ->
    Richarea.setText e.target.value
