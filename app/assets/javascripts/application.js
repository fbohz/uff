//= require jquery
//= require jquery_ujs
//= require jquery-ui

// The below code is for Formulas Form Page, /formulas/#/new and /formulas/#/edit
// 'Add Ingredient' button adds a new ingredient input feild
// 'x' button removes ingredient input field
$(document).ready(function(){
    // when 'Add Ingredient' button is clicked:
    $('#addNewIngredient').click(function(){
  
      // create date object
      let date = new Date();
  
      // get number of milliseconds since midnight Jan 1, 1970, and use it for ingredients key 
      let mSec = date.getTime();
  
      // Replace 0 with milliseconds 
      idAttributeIngredient = "wall_artists_attributes_0_artist_name".replace("0", mSec);
      nameAttributeIngredient = "wall[artists_attributes][0][artist_name]".replace("0", mSec);
  
      // append input field with unique ingredient attributes in div artistSet
      $('div#artistSet').append(
        `<div class='ingredientsForm input-group mb-3'>
          <input class='form-control' type='text' name='${nameAttributeIngredient}' id='${idAttributeIngredient}'>
          <div class='input-group-append'>
            <span class='input-group-text'>
              <button type='button' class='removeIngredient close'> ×</button>
            </span>
          </div>
        </div>`
      );
    });
    
    // when button class of .removeIngredient 'x' button is clicked in div of ingredientSet
    $("div#artistSet").on('click', '.removeIngredient', function(){
      // 'this' is the 'x' button
      // 'closest' goes up thru the DOM, looking for the first ancestor with the div of class ingredientsForm
      // .remove() takes removes it from the DOM
      $(this).closest('.ingredientsForm').remove(); 
    });
  });
  