---
title: Responsive Web Design
date: 2019-03-16
tags: [web, notes]
weight: 1
---

# Basic HTML and HTML5

HTML5 tags: header, footer, nav, video, article, section, main

## Text

h1-h6,p,s,u,em,strong,a,time

## List

ul,ol,li  
table: `<table><thead><tr><th></th></tr></thead><tbody><tr><td></td></tr></tbody></table>`

## Figure

figure,figcaption,img  
i

## Form

* form: `<form action=""> </form>`
* text field: `<input type="text" placeholder="" required>`
* fieldset, legend
* radio/checkbox: `<label for="name"> <input type="radio" name="name" checked> Name </label>`
* button: `<button type="submit"> </button>`

## Others

* audio: `<audio id="meowClip" controls><source src="audio/meow.mp3" type="audio/mpeg" /><source src="audio/meow.ogg" type="audio/ogg" /></audio>`
* accesskey
* tabindex



<!--more-->

# Basic CSS

* color:
  * #FFA500
  * rgb(218,112,214)
  * hsl(0,100%,50%)
  * `linear-gradient(gradient_direction, color 1, color 2, color 3, ...)`
  * opacity
* complementary color
  * red-cyan
  * green-magenta
  * blue-yellow
  * opacity
* font
  * font-size
  * font-weight
  * font-style
  * font-family
    * sans-serif
    * monospace
    * Lobster with `<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">`
    * degrade: Lobster, Helvetica
  * text-align: justify/center/right/left
  * text-transform
    * lowercase,uppercase,capitalize,initial,inherit,none
  * line-height
* border
  * border-color
  * border-width
  * border-style
  * border-radius
* box-shadow: `0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)`
* padding
  * padding-top/right/bottom/left
* margin
  * auto: set to center
* 伪类
  * p:hover
  * :root
* 伪元素
  * ::before
  * ::after
* div
  * width
  * height
  * background-color
  * display: none; = visibility: hidden;
* transform
  * scale(2)
  * skewX/skewY(-32deg)
* animation
  * animation-name: myname
  * animation-duration
  * animation-fill-mode: forwards
  * animation-iteration-count: infinite
  * animation-timing-function: ease/ease-in/ease-out/linear/cubic-bezier
  * `@keyframes myname {0%{} 100%{}}`

## unit

* absolute: in,mm;px
* relative: em,rem
* vw,vh,vmin,vmax: 1vw = 1% width of browser window

## variable

* `--myvar: gray`
* `background: var(--myvar,black);`

## selectors

* !important>inline>id>class
* attribute selectors: `[type='radio']`
* :root
* @meida(max-width: 500px)

# CSS Box Model

* display: block/inline;
* position
  * relative: still in normal flow
  * absolute: remove, locked relative to its closest positioned ancestor
  * fixed: relative to broswer
* float: left/right
  * remove
* z-index

# CSS Flex

* display: flex

## Flexbox-Container

* flex-direction: row/column
* justify-content: center/flex-start/flex-end/space-between/space-around (align the main-axis)
* align-items: flex-start/flex-end/center/stretch/baseline (align the cross-axis)
* flex-wrap: wrap

## Flexbox-Item

* flex-shrink: 1/3
* flex-grow
* flex-basis
* flex: shrink grow basis
* order
* align-self

# CSS Grid

## Grid-Container

* display: grid
* grid-template-columns: 50px 50px 50px
* grid-template-rows:
  * both can use Gird Units: `fr,auto,%`
  * repeat(3,50px)
  * minmax(50px,200px)
  * auto-fill
  * auto-fit:only difference is that when the container's size exceeds the size of all the items combined, auto-fill keeps inserting empty rows or columns and pushes your items to the side, while auto-fit collapses those empty rows or columns and stretches your items to fit the size of the container.
* grid-column-gap:
* grid-gap: row column
* justify-items
* align-items
* grid-template-ares:

## Grid-Item

* grid-column: from/to
* grid-row: from/to
* justify-self: start/center/end
* align-self