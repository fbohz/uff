// // The below code is for  Form Page, /#/new and /#/edit

$(document).ready(function(){
   let counter = 0;
  let counter2 = 0;
  $('#addArtist').click(function(){
    // event.preventDefault(); 
    counter += 1;

    // Replace 0 with counter 
    idAttribute = "wall_artists_attributes_0_artist_name".replace("0", counter);
    nameAttribute = "wall[artists_attributes][0][artist_name]".replace("0", counter);

    $('#fieldAdd').append(
      `<div class='field addedSet' id='artist_autocomplete_add'>
        <input class='form-control' type='text' name='${nameAttribute}' id='${idAttribute}'>

        <datalist id="${idAttribute}">
        <% Artist.all.each do |a| %>
        <option value="<%= a.artist_name %>">
        <% end %>
        </datalist>

        <div class='input-group-append'>
          <span class='input-group-text'>
            <button type='button' class='removeX close'> ×</button>
          </span>
    

      </div>
      </div>`

      
    );
  });
  
  // x click
  $(".input-group-append").on('click', '.removeX', function(){
    // 'this' is the 'x' button
    // .remove() takes removes it from the DOM
    $(this).closest('.addedSet').remove(); 
  });

  $('#tagAdd').click(function(){
    // event.preventDefault(); 
    counter2 += 1;

    // Replace 0 with counter 
    idAttribute = "wall_tags_attributes_0_name".replace("0", counter2);
    nameAttribute = "wall[tags_attributes][0][name]".replace("0", counter2);

    // append input field with unique attributes in div 
    $('#fieldAdd2').append(
      `<div class='field addedSet'>
        <input class='form-control' type='text' name='${nameAttribute}' id='${idAttribute}'>

        <div class='input-group-append'>
          <span class='input-group-text'>
            <button type='button' class='removeX close'> ×</button>
          </span>
    

      </div>
      </div>`

      
    );
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



