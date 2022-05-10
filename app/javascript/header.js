['DOMContentLoaded', 'mouseover'].forEach ( event  => {
document.addEventListener(event,(e) => {
  let aLinks = document.querySelectorAll('a')
  // If a href == the href of the link we are on then add the class
  aLinks.forEach((link) => {
    if (window.location.href === link.href) {
      if (!document.querySelector('.selected')) {
        // Add a subdiv under the link to show the selected link
        if (document.querySelectorAll('.selected').length < 1 ) {
          link.appendChild(document.createElement('div'))
          link.querySelector('div').classList.add('selected')
        }
      }
    }
    });
  });
});