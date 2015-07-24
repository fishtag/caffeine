class WysiwygInput < SimpleForm::Inputs::Base
  def input
    input_id = "#{object_name}_#{attribute_name}"
    input_name = "#{object_name}[#{attribute_name}]"
    hidden = hidden_field_for input_name, input_id
    tag = template.content_tag('div', @builder.object.send(attribute_name),
                               { class: 'editable medium-editor-input', data: { input: input_id } }, false)
    [hidden, tag].join.html_safe
  end

  def hidden_field_for(name, id)
    input_html_options[:type] ||= :hidden
    @builder.hidden_field(nil,
                          input_html_options.merge(
                            value: @builder.object.send(attribute_name),
                            name: name,
                            id: id))
  end

  def input_name(attribute)
    "#{@builder.object.class.name.underscore.to_sym}_#{attribute}"
  end
end
