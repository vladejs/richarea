## Mardown textarea for Meteor

This package is useful when you have a form with a `textarea` field and want to power it with Markdown (preview included).

Usecase: users want to insert a properly formatted description of an item.

## What it has

The package exposes two templates (`RichArea`, `RichAreaPreview`) and one object: `Richarea`.

# How to use them

### 1. Allow the user to write information with preview
```
<body>

  <form id="product">
	<input type="text" placeholder="Product title">
	{{> RichArea }}
  </form>

</body>
```

That will render an unstyled textarea with its preview below it. Of course, you will want more control about where the preview content should render, so you can use the template in a custom manner:

```
{{#RichArea custom=true}}
<div class="row">
	<div class="span6">
		<textarea name="itemDescription" id="item-desc" cols="30" rows="10"></textarea>
	</div>
	<div class="span6">
		{{> RichAreaPreview}}
	</div>
</div>
{{/RichArea}}
```
In the snippet above, you must include a textarea tag. The inclusion of `RichAreaPreview` is optional and will render the preview in the exact section where you included it.

## 2. Show properly formatted information in markdown

Here just use the second template with a `content` parameter, so for example, if you are coding your Product details page, something like the following will do the trick:
```
<div class="product">
	
	<h1> {{ title }} </h1>
	
	<div class="item-description">
		{{> RichAreaPreview content=description }}
	</div>

</div>
```

If `content` is not provided, it will try to read it from current data context, if there is no key with that name, it will render `undefined`.

## 3. Use `Richarea` object to set and retrieve information

Richarea object exposes the following API:

- `Richarea`.setText(value) : set text value in markdown
- `Richarea.getText()` : returns plain markdown text
- `Richarea.getHTML()` : returns markdown text in HTML.

In the example above if you want to submit the description field to the database, you could read from  `Richarea` object directly :

```
// insert_product.js

Template.Product.events({
	'submit form' : function(e,t){
		e.preventDefault();

		var description = Richtext.getText();
		var rawHTMLDesc = Richtext.getHTMl();

		// do your thing...
	}
});
```

# Limitations

- Currently, when you include the same template twice, the value between them gets shared. 

If you don't want that behavior, send me a pull requests :)