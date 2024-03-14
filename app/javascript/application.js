// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery-ui/widgets/datepicker
//= require jquery3
//= require popper
//= require bootstrap


$(document).ready(function() {
    $('#datepicker').datepicker({
        dateFormat: 'yy-mm-dd' // Customize date format if needed
    });
});
