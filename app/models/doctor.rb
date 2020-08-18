class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  # <%= form_with url: "/search", method: :get do |form| %>
  #   <%= form.label :query, "Search for:" %>
  #   <%= form.text_field :query %>
  #   <%= form.submit "Search" %>
  # <% end %>


end
