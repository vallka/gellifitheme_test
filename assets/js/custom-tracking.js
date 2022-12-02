$(function(){
    if ($('#order-detail #order-trackin-number').length>0) {
      setup_tracking_info();
    }
});
  
function setup_tracking_info() {
    const tracking_id = '#order-detail #order-trackin-number';
  
    if ($(tracking_id).length>0) {
      const nu = $(tracking_id).text()
      let text = nu;
  
      if (nu.match(/^P2G\d+$/i)) {
        let link='https://www.parcel2go.com/tracking/' + nu;
        text = '<a href="'+link+'" target="_blank">' + nu + '</a>';
      }
      else if (nu.match(/^1Z\w+$/i)) {
        let link='https://www.ups.com/track?loc=en_GB&tracknum='+nu+'&requester=ST/trackdetails';
        text = '<a href="'+link+'" target="_blank">' + nu + '</a>';
      }
      else if (nu.match(/^DPD\d+$/i)) {
        let link='https://www.dpdlocal-online.co.uk/tracking/' + nu;
        text = '<a href="'+link+'" target="_blank">' + nu + '</a>';
      }
      else if (nu.match(/^DHL:\d+$/i) || nu.match(/^\d{10}$/)) {
        let link='https://www.dhl.co.uk/en/express/tracking.html?AWB=' + nu.substr(4);
        text = '<a href="'+link+'" target="_blank">' + nu + '</a>';
      }
      else if (nu.match(/^\d{16}$/)) {
        let link='https://new.myhermes.co.uk/track.html#/parcel/' + nu;
        text = '<a href="'+link+'" target="_blank">' + nu + '</a>';
      }
      else {
        return;
      }
  
      $(tracking_id).html(text);
    }
}
  
  