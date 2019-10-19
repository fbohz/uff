// // The below code is for  Form Page, /#/new and /#/edit
$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    let counter = 0;
    let counter2 = 0;
    // let output = "<option value='TEST'>";
    let output = "";
    
    $.getJSON('/static.json', function(json) {
      $.each(json.data, function(key, value) {
        output += "<option value="+ "'" + value.name + "'" + ">";
        // console.log("<option value="+ "'" + value.name + "'" + ">");
      });
    // debugger;
    });
        // create date object
    let date = new Date();

    // get number of milliseconds since midnight Jan 1, 1970, and use it for ingredients key 
    let mSec = date.getMilliseconds();

    $('#addArtist').click(function(){
      // event.preventDefault(); 

      // Replace 0 with counter 
      idAttribute = "wall_artists_attributes_0_name".replace("0", mSec);
      nameAttribute = "wall[artists_attributes][0][name]".replace("0", mSec);

      $('#fieldAdd').append(
        `<div class='field addedSet column is-one-quarter' id='artist_autocomplete_add'>
          <br><input class='control' type='text' name='${nameAttribute}' list="artist_list" placeholder="Search artist" required>

          <datalist id="artist_list">
          ${output}
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

      // Replace 0 with counter 
      idAttribute = "wall_tags_attributes_0_name".replace("0", mSec);
      nameAttribute = "wall[tags_attributes][0][name]".replace("0", mSec);

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
      });

  });

});
  

