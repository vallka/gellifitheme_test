
var deferredPrompt;

if ('serviceWorker' in navigator) {
  navigator.serviceWorker
    .register('/sw.js')
    .then(function() {
      //console.log('Service worker registered!');
    });
}

window.addEventListener('beforeinstallprompt', function(event) {
  //console.log('beforeinstallprompt fired');
  event.preventDefault();
  deferredPrompt = event;
  $('#install-app-btn').css('display','inline-block');
  $('#install-app-btn').click(function(){
    if (deferredPrompt) {
      deferredPrompt.prompt();
  
      deferredPrompt.userChoice.then(function(choiceResult) {
        console.log(choiceResult.outcome);
  
        if (choiceResult.outcome === 'dismissed') {
          //console.log('User cancelled installation');
        } else {
          //console.log('User added to home screen');
          $('#install-app-btn').hide();
        }
      });
  
      deferredPrompt = null; 
    }
  });
  return false;
});

/*
if ('Notification' in window) {
  if (Notification.permission=='default') {
    $('#enable-n-btn').css('display','inline-block');
    $('#enable-n-btn').click(function(){
      console.log(Notification.permission);

      Notification.requestPermission().then(function(result){
        console.log(result);
        if (result!='granted') {
          console.log('Notifications blocked');
        }
        else {
          console.log('Notifications allowed');
          $('#enable-n-btn').hide();
        }
      });
    });
  }
}
*/
