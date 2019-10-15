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
      `<div class='field addedSet column is-one-quarter' id='artist_autocomplete_add'>
        <br><input class='control' type='text' name='${nameAttribute}' list="artist_list" placeholder="Search artist" required>

        <datalist id="artist_list">
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
  


  $('#tagAdd').click(function(){
    // event.preventDefault(); 
    counter2 += 1;

    // Replace 0 with counter 
    idAttribute = "wall_tags_attributes_0_name".replace("0", counter2);
    nameAttribute = "wall[tags_attributes][0][name]".replace("0", counter2);

    // append input field with unique attributes in div 
    $('#fieldAdd2').append(
      `<div class='field addedSet column is-one-quarter'>
        <br><input class='control' type='text' name='${nameAttribute}' id='${idAttribute}' placeholder='tag name' required>

        <div class='input-group-append'>
          <span class='input-group-text'>
            <button type='button' class='removeX close'> ×</button>
          </span>
    

      </div>
      </div>`

      
    );
  });

       // 'x' button function
    $("div.dynamicField").on('click', '.removeX', function(){
      // 'closest' goes up thru the DOM, looking for the first ancestor with the div of class dynamicField
      // .remove() takes removes it from the DOM
      $(this).closest('.addedSet').remove(); 
      counter -= 1
      counter2 -= 1
    });
});


  

