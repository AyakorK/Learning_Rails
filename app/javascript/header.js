
window.onload = () => {
  setInterval(() => {
    let aLinks = $('a')
    aLinks.each(function (index, link) {
      if (window.location.href === link.href) {
        if (!$(link).find('.selected').length) {
          $(link).append('<div class="selected"></div>')
          window.onload
        }
      }
    })
  }, 10);
}

