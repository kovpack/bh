defmodule Bh.Bh3.Icon do
  @moduledoc """
  Twitter Bootstrap 3 glyphicons helpers for Phoenix.
  """
  use Phoenix.HTML

  @doc """
  Generates glyphicons HTML markup.

  Keep in mind, that if you use Brunch for assets, most likely all glyphicons
  should be copied to `web/static/assets/fonts` folder.

  ## Examples

  Icon name can be passed as a string or symbol:

      <%= bh_icon :star %>
      <span aria-hidden="true" class="glyphicon glyphicon-star"></span>

      <%= bh_icon "zoom-in" %>
      <span aria-hidden="true" class="glyphicon glyphicon-zoom-in"></span>

      <%= bh_icon :"minus-sign" %>
      <span aria-hidden="true" class="glyphicon glyphicon-minus-sign"></span>

  Supported names:

  `"adjust"`, `"alert"`, `"align-center"`, `"align-justify"`, `"align-left"`,
  `"align-right"`, `"apple"`, `"arrow-down"`, `"arrow-left"`, `"arrow-right"`,
  `"arrow-up"`, `"asterisk"`, `"baby-formula"`, `"backward"`, `"ban-circle"`,
  `"barcode"`, `"bed"`, `"bell"`, `"bishop"`, `"bitcoin"`, `"blackboard"`,
  `"bold"`, `"book"`, `"bookmark"`, `"briefcase"`, `"btc"`, `"bullhorn"`,
  `"calendar"`, `"camera"`, `"cd"`, `"certificate"`, `"check"`,
  `"chevron-down"`, `"chevron-left"`, `"chevron-right"`, `"chevron-up"`,
  `"circle-arrow-down"`, `"circle-arrow-left"`, `"circle-arrow-right"`,
  `"circle-arrow-up"`, `"cloud"`, `"cloud-download"`, `"cloud-upload"`,
  `"cog"`, `"collapse-down"`, `"collapse-up"`, `"comment"`, `"compressed"`,
  `"console"`, `"copy"`, `"copyright-mark"`, `"credit-card"`, `"cutlery"`,
  `"dashboard"`, `"download"`, `"download-alt"`, `"duplicate"`, `"earphone"`,
  `"edit"`, `"education"`, `"eject"`, `"envelope"`, `"equalizer"`, `"erase"`,
  `"eur"`, `"euro"`, `"exclamation-sign"`, `"expand"`, `"export"`,
  `"eye-close"`, `"eye-open"`, `"facetime-video"`, `"fast-backward"`,
  `"fast-forward"`, `"file"`, `"film"`, `"filter"`, `"fire"`, `"flag"`,
  `"flash"`, `"floppy-disk"`, `"floppy-open"`, `"floppy-remove"`,
  `"floppy-save"`, `"floppy-saved"`, `"folder-close"`, `"folder-open"`,
  `"font"`, `"forward"`, `"fullscreen"`, `"gbp"`, `"gift"`, `"glass"`,
  `"globe"`, `"grain"`, `"hand-down"`, `"hand-left"`, `"hand-right"`,
  `"hand-up"`, `"hd-video"`, `"hdd"`, `"header"`, `"headphones"`, `"heart"`,
  `"heart-empty"`, `"home"`, `"hourglass"`, `"ice-lolly"`,
  `"ice-lolly-tasted"`, `"import"`, `"inbox"`, `"indent-left"`,
  `"indent-right"`, `"info-sign"`, `"italic"`, `"jpy"`, `"king"`, `"knight"`,
  `"lamp"`, `"leaf"`, `"level-up"`, `"link"`, `"list"`, `"list-alt"`, `"lock"`,
  `"log-in"`, `"log-out"`, `"magnet"`, `"map-marker"`, `"menu-down"`,
  `"menu-hamburger"`, `"menu-left"`, `"menu-right"`, `"menu-up"`, `"minus"`,
  `"minus-sign"`, `"modal-window"`, `"move"`, `"music"`, `"new-window"`,
  `"object-align-bottom"`, `"object-align-horizontal"`, `"object-align-left"`,
  `"object-align-right"`, `"object-align-top"`, `"object-align-vertical"`,
  `"off"`, `"oil"`, `"ok"`, `"ok-circle"`, `"ok-sign"`, `"open"`,
  `"open-file"`, `"option-horizontal"`, `"option-vertical"`, `"paperclip"`,
  `"paste"`, `"pause"`, `"pawn"`, `"pencil"`, `"phone"`, `"phone-alt"`,
  `"picture"`, `"piggy-bank"`, `"plane"`, `"play"`, `"play-circle"`, `"plus"`,
  `"plus-sign"`, `"print"`, `"pushpin"`, `"qrcode"`, `"queen"`,
  `"question-sign"`, `"random"`, `"record"`, `"refresh"`,
  `"registration-mark"`, `"remove"`, `"remove-circle"`, `"remove-sign"`,
  `"repeat"`, `"resize-full"`, `"resize-horizontal"`, `"resize-small"`,
  `"resize-vertical"`, `"retweet"`, `"road"`, `"rub"`, `"ruble"`, `"save"`,
  `"save-file"`, `"saved"`, `"scale"`, `"scissors"`, `"screenshot"`,
  `"sd-video"`, `"search"`, `"send"`, `"share"`, `"share-alt"`,
  `"shopping-cart"`, `"signal"`, `"sort"`, `"sort-by-alphabet"`,
  `"sort-by-alphabet-alt"`, `"sort-by-attributes"`, `"sort-by-attributes-alt"`,
  `"sort-by-order"`, `"sort-by-order-alt"`, `"sound-5-1"`, `"sound-6-1"`,
  `"sound-7-1"`, `"sound-dolby"`, `"sound-stereo"`, `"star"`, `"star-empty"`,
  `"stats"`, `"step-backward"`, `"step-forward"`, `"stop"`, `"subscript"`,
  `"subtitles"`, `"sunglasses"`, `"superscript"`, `"tag"`, `"tags"`, `"tasks"`,
  `"tent"`, `"text-background"`, `"text-color"`, `"text-height"`,
  `"text-size"`, `"text-width"`, `"th"`, `"th-large"`, `"th-list"`,
  `"thumbs-down"`, `"thumbs-up"`, `"time"`, `"tint"`, `"tower"`, `"transfer"`,
  `"trash"`, `"tree-conifer"`, `"tree-deciduous"`, `"triangle-bottom"`,
  `"triangle-left"`, `"triangle-right"`, `"triangle-top"`, `"unchecked"`,
  `"upload"`, `"usd"`, `"user"`, `"volume-down"`, `"volume-off"`,
  `"volume-up"`, `"warning-sign"`, `"wrench"`, `"xbt"`, `"yen"`, `"zoom-in"`,
  `"zoom-out"`
  """
  def bh_icon(name) do
    opts = [
      class: "glyphicon glyphicon-#{name}",
      "aria-hidden": "true"
    ]
    content_tag :span, "", opts
  end
end
