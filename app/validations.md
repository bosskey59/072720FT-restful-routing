Validations?

-limit data from making it to the DB
-require username as being there / unique (do this via a controller logic)

active record validations

Methods that run validations
-create!
-save!
-update!

valid?
invalid?


<!-- form for use when you a model to work of off-->




<!-- form tag use for anything else -->






<!-- form with will replace both form tag & form for-->
<%= form_with model:food_item, local: :true do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name, class: food_item.errors.any? ? "custom_errors" : nil %>
  <br>
  <h4>ingredients:</h4>
  <%= form.fields_for :ingredients  do |ing| %>
    <%= ing.label :name %>
    <%= ing.text_field :name %>
    <%= ing.label :calories %>
    <%= ing.number_field :calories %>
    <%= ing.label :ss_grams %>
    <%= ing.number_field :ss_grams %>
  <% end %>
  <br>
  <%= form.submit%>
<% end %>


