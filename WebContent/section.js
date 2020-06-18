$(document).ready(function() {

    
    $('#about').on('click', function() {
      
        $('#about1').show();
        $('#team1').hide();
        $('#service1').hide();
        $('#contact1').hide();
        $('#signup1').hide();
        $('#pharmacist1').hide();
        $('#receptionist1').hide();
        $('#doctor1').hide();
    });    
    $('#team').on('click', function() {
     
        $('#about1').hide();
        $('#team1').show();
        $('#service1').hide();
        $('#contact1').hide();
        $('#signup1').hide();
        $('#pharmacist1').hide();
        $('#doctor1').hide();
        $('#receptionist1').hide();
    });  
    $('#service').on('click', function() {
         
        $('#about1').hide();
        $('#team1').hide();
        $('#service1').show();
        $('#contact1').hide();
        $('#signup1').hide();
        $('#pharmacist1').hide();
        $('#doctor1').hide();
        $('#receptionist1').hide();
    });  
    $('#contact').on('click', function() {
           
        $('#about1').hide();
        $('#team1').hide();
        $('#service1').hide();
        $('#contact1').show();
        $('#signup1').hide();
        $('#pharmacist1').hide();
        $('#doctor1').hide();
        $('#receptionist1').hide();
    });  
      $('#signup').on('click', function() {
          
        $('#about1').hide();
        $('#team1').hide();
        $('#service1').hide();
        $('#contact1').hide();
        $('#signup1').show();
        $('#pharmacist1').hide();
        $('#doctor1').hide();
        $('#receptionist1').hide();
    });  
      $('#pharmacist11').on('click', function() {
         
       $('#about1').hide();
       $('#team1').hide();
       $('#service1').hide();
       $('#contact1').hide();
       $('#signup1').hide();
       $('#pharmacist1').show();
       $('#doctor1').hide();
       $('#receptionist1').hide();
   });  
      $('#doctor11').on('click', function() {
          
       $('#about1').hide();
       $('#team1').hide();
       $('#service1').hide();
       $('#contact1').hide();
       $('#signup1').hide();
       $('#pharmacist1').hide();
       $('#doctor1').show();
       $('#receptionist1').hide();
   });  
      $('#receptionist11').on('click', function() {
     
       $('#about1').hide();
       $('#team1').hide();
       $('#service1').hide();
       $('#contact1').hide();
       $('#signup1').hide();
       $('#pharmacist1').hide();
       $('#doctor1').hide();
       $('#receptionist1').show();
   });  
});



