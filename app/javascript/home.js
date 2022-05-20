
window.onload = () => {
    let paused = false;
    let index = 1;
    let firstArticle = $('.article_slider')[0];
    if ($(firstArticle.classList.contains('translate-x-full'))){
        $(firstArticle).removeClass('translate-x-full');
        $(firstArticle).addClass('translate-x-0');
    }

    $(document).mouseover((e) => {
        paused = e.target.classList.contains('article_slider') || e.target.parentNode.classList.contains('article_slider')|| e.target.parentNode.parentNode.classList.contains('article_slider');
    });
    setInterval(() => {
        console.log(paused);
        if (!paused) {
            slide()
        }

    }, 2500);

    function slide() {
        let articlesToSlide = $('.article_slider');
        if (index === 0) {
            $(articlesToSlide[articlesToSlide.length - 1]).removeClass("translate-x-0");
            $(articlesToSlide[articlesToSlide.length - 1]).addClass("translate-x-full");
        } else {
            $(articlesToSlide[index - 1]).removeClass("translate-x-0");
            $(articlesToSlide[index - 1]).addClass("translate-x-full");
        }
        if (index === articlesToSlide.length) {
            index = 0;
        }
        $(articlesToSlide[index]).addClass("translate-x-0");
        $(articlesToSlide[index]).removeClass("translate-x-full")
        index++;

    }
}


