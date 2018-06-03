class WidgetListingPresenter
  extend Forwardable

  def_delegators :@widget,
                 :quantity,
                 :color,
                 :size,
                 :inventory_approaching_empty?,
                 :inventory_empty?

  attr_reader :widget

  def initialize(widget)
    @widget = widget
  end

  def name
    "Widget #{capitalize_all_the_words(widget.name)}"
  end

  def created_at
    widget.created_at.strftime('%b %-d, %Y')
  end

  private

  def capitalize_all_the_words(str_of_words)
    str_of_words.split
                .map(&:capitalize)
                .join(' ')
  end

end
