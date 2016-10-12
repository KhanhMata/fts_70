# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#question_answer_type').on 'change', ->
    answer_type =  $(this).val()
    answer_text = '<div class="text_question">'
    answer_text += '<label><%= I18n.t "questions.answer" %></label>'
    answer_text += '<textarea class="form-control"'
    answer_text += 'name="question[answers_attributes][0][content]"'
    answer_text += 'id="question_answers_attributes_0_content">'
    answer_text += '</textarea></div>'
    if answer_type == '<%= Settings.questions.answer_type.text %>'
      $('.choice_question').remove()
      $('#answer_field').html answer_text
      $('.add_fields').addClass 'hide'
    if answer_type == '<%= Settings.questions.answer_type.single_choice %>'
      $('.text_question').remove()
      $('.add_fields').removeClass 'hide'
      $('.answers_checkbox').removeAttr 'checked'
      $('.answers_checkbox').first().prop('checked', true);
    if answer_type == '<%= Settings.questions.answer_type.multi_choice %>'
      $('.text_question').remove()
      $('.add_fields').removeClass 'hide'
  $('#question').on 'change', 'input[type=checkbox]', (e) ->
    if $('#question_answer_type').val() == '<%= Settings.questions
      .answer_type.single_choice %>'
      $('.answers_checkbox').removeAttr 'checked'
      @checked = true
