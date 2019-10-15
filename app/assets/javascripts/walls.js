// // The below code is for Formulas Form Page, /formulas/#/new and /formulas/#/edit
// 'Add Ingredient' button adds a new ingredient input feild
// 'x' button removes ingredient input field
$(document).ready(function(){
  // when 'Add Ingredient' button is clicked:
  let counter = 0;
  $('#addArtist').click(function(){
    // event.preventDefault(); 
    counter += 1;

    // Replace 0 with counter 
    idAttribute = "wall_artists_attributes_0_artist_name".replace("0", counter);
    nameAttribute = "wall[artists_attributes][0][artist_name]".replace("0", counter);

    // append input field with unique ingredient attributes in div artistSet
    $('#fieldAdd').append(
      `<div class='field artistSet' id='artist_autocomplete_add'>
        <input class='form-control' type='text' name='${nameAttribute}' id='${idAttribute}'>

        <datalist id="artist_autocomplete_add">
        <% Artist.all.each do |a| %>
        <option value="<%= a.artist_name %>">
        <% end %>
        </datalist>

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

  // $(document).ready(function() {
  //   let counter = 1;
  //   $("#addArtist").click(function(){
  //     counter += 1; 
  //     $( "#fieldAdd" ).append( 
  //             `<div class='field artistSet'>
  //               <input class='form-control' type='text' name='${nameAttributeIngredient}' id='${idAttributeIngredient}'>
  //               <div class='input-group-append'>
  //                 <span class='input-group-text'>
  //                   <button type='button' class='removeIngredient close'> ×</button>
  //                 </span>
  //               </div>
  //             </div>`
            
      
      
      
  //     );
  //     });
  // });



