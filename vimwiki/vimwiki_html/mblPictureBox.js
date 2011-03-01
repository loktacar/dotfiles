 var mblPictureBox = {
    default_options: {
        'show_close': true,
        'show_text': true,
        'show_navigation': true,
        'show_count': true,
        'disable_keyboard': false,
        'load_item': undefined,
            // The value of the 'load_item' key should be a function with
            // three arguments. e.x.: function load_item(link, content, text)
            // link: this is a jquery object of the link/element that was pressed
            // content: this a jquery object which will be displayed where the image is normally placed
            // text: this a jquery object of the div which contains the text
            //
            // load_item should call mblPictureBox.resizeContainerToFit() and mblPictureBox.containerCenterInWindow()
            // at the last possible moment, preferable after all ajax calls etc. have finished. 
        'get_text': undefined
            // The value of the 'get_text' key should be a function which accepts
            // only one argument. The link which was pressed the function should then return
            // the HTML and/or text which shall be displayed in the text div.
    },
    container_css: {
        'display': 'none',
        'background': '#fff url(\'http://mbl.is/img/ajax-loader.gif\') no-repeat center center',
        'opacity': '1',
        'z-index': '9999',
        'height': '100px',
        'width': '100px',
        'padding': '5px'
    },
    overlay_css: {
        'display': 'none',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'opacity': '1',
        'background': 'url(\'http://mbl.is/img/picturebox/overlay-bg.png\')',
        'z-index': '9990'
    },
    btn_css: {
        'position': 'absolute',
        'display': 'none',
        'outline': 'none'
    },
    prevBtn_css: {
        'background': 'url("http://mbl.is/img/picturebox/picturebox_left.png") no-repeat 0% 50%',
        'top': '0px',
        'bottom': '0px',
        'left': '-18px',
        'width': '50px'
    },
    nextBtn_css: {
        'background': 'url("http://mbl.is/img/picturebox/picturebox_right.png") no-repeat 100% 50%',
        'top': '0px',
        'bottom': '0px',
        'right': '-18px',
        'width': '50px'
    },
    hideBtn_css: {
        'background': 'url("http://mbl.is/img/picturebox/picturebox_close.png") no-repeat',
        'height': '37px',
        'width': '37px',
        'top': '-18px',
        'right': '-18px'
    },
    countDiv_css: {
        'position': 'absolute',
        'left': '0px',
        'top': '-16px',
        'height': '16px',
        'background': '#fff',
        'padding': '2px 5px'
    },
    textDiv_css: {
        'background': '#eee',
        'margin': '5px 0 0',
        'padding': '3px'
    }
}

mblPictureBox.init = function () {

    if ($('#pBox').length == 0)
        this.initDOMElements();
};

mblPictureBox.initDOMElements = function() {
    this.overlay = $('<div id="pBox-overlay"></div>').
      css(this.overlay_css).
      css({
        'height': $(document).height() + 'px',
        'width': $(document).width() + 'px'
      }).
      click(function () {
        mblPictureBox.hide();
      });

    this.container = $('<div id="pBox"></div>').
      css(this.container_css);

    this.imageContainer = $('<div id="pBox-image-contain"></div>');
    this.container.append(this.imageContainer);

    this.imageDiv = $('<div class="pBox-image clearfix"></div>').
      css({
        'position': 'relative'
      });
    this.imageContainer.append(this.imageDiv);

    this.prevBtn = $('<a href="#" class="pBox-prev-btn" title="Fyrri mynd"></a>').
      css(this.btn_css).css(this.prevBtn_css);

    this.nextBtn = $('<a href="#" class="pBox-next-btn" title="Næsta mynd"></a>').
      css(this.btn_css).css(this.nextBtn_css);

    this.imageContainer.append(this.prevBtn).append(this.nextBtn);

    this.prevBtn.bind('click', function() {
        var prev = null;
        var prevFound = false;

        mblPictureBox.all_links.each(function() {
            prevFound = prevFound ||
                mblPictureBox.curr_link.attr('href') == $(this).attr('href');

            if (!prevFound)
                prev = $(this);
        });

        if (prev)
            mblPictureBox.change(prev);

        return false;
    });

    this.nextBtn.bind('click', function() {
        var next = null;
        var currFound = false;

        mblPictureBox.all_links.each(function() {
            if (currFound)
            {
                next = $(this);
                currFound = false;
            }

            currFound = $(this).attr('href') == mblPictureBox.curr_link.attr('href');
        });

        if (next)
            mblPictureBox.change(next);

        return false;
    });

    this.textDiv = $('<div class="pBox-text"></div>').
      css(this.textDiv_css);
    this.container.append(this.textDiv);

    this.countDiv = $('<div class="pBox-count"></div>').
      css(this.countDiv_css);
    this.container.append(this.countDiv);

    this.hideBtn = $('<a href="#" class="pBox-close"></a>').
      css(this.btn_css).css(this.hideBtn_css).
      bind('click', function() {
        mblPictureBox.hide();

        return false;
      });
    this.container.append(this.hideBtn);

    $('body').append(this.overlay).append(this.container);
};

mblPictureBox.overlayFillWindow = function() {
    this.overlay.css({
        'height': $(document).height() + 'px',
        'width': $(document).width() + 'px'
    });
};

mblPictureBox.containerCenterInWindow = function () {
    var top_bottom = Math.round(($(window).height() - this.container.height()) / 2);
    var left_right = Math.round(($(window).width() - this.container.width()) / 2);

    this.container.css({
        'position': 'fixed',
        'top': top_bottom + 'px',
        'left': left_right + 'px'
    });
};

mblPictureBox.resizeContainerToFit = function () {
    var height = 0;
    var width = 0;

    width += this.imageDiv.children().width();
    if (width == 0)
        width = 100;

    this.container.css('width', width + 'px');

    height += this.imageDiv.height();
    if (this.options.show_text)
        height += this.textDiv.outerHeight(true);

    if (height == 0)
        height = 100;

    this.container.css('height', height + 'px');

    this.prevBtn.css('width', Math.floor(this.imageDiv.children().width() / 2) + 18 + 'px');
    this.nextBtn.css('width', Math.floor(this.imageDiv.children().width() / 2) + 18 + 'px');
};

mblPictureBox.hide = function () {
    this.container.hide().css(this.container_css);
    this.imageDiv.empty();
    this.textDiv.empty();
    this.overlay.hide();
    this.nextBtn.hide();
    this.prevBtn.hide();
    this.hideBtn.hide();

    $(document).unbind('keypress', this.keyPressed);
};

mblPictureBox.show = function () {
    this.overlay.show();
    this.containerCenterInWindow();
    this.container.show();

    if (this.options.load_item === undefined)
        this.loadNewImage(this.curr_link);
    else
        this.load_item(this.curr_link, this.imageDiv, this.textDiv);

    // Keybindings
    $(document).bind('keypress', this.keyPressed);
};

mblPictureBox.change = function (link) {
    this.container.css(this.container_css).show();
    this.containerCenterInWindow();
    this.imageDiv.empty();
    this.textDiv.empty();

    this.curr_link = link;

    if (this.options.load_item === undefined)
        this.loadNewImage(this.curr_link);
    else
      this.load_item(this.curr_link, this.imageDiv, this.textDiv);
};

mblPictureBox.loadNewImage = function (link) {
    this.nextBtn.hide();
    this.prevBtn.hide();
    this.hideBtn.hide();

    var text = link.attr('title');
    if (!text) text = link.find('img').attr('alt');

    if (typeof(this.options.get_text) == 'function') {
        var newtext = this.options.get_text(link);
        if (newtext) {
            text = newtext;
        }
    }

    this.textDiv.show().css(this.textDiv_css);
    if (!this.options.show_text)
        this.textDiv.hide();

    var img = new Image();

    $(img).load(function() {
        mblPictureBox.imageDiv.empty().append($(this));
        if (mblPictureBox.options.show_text) {
            mblPictureBox.textDiv.html(text);

            if (!mblPictureBox.textDiv.height())
                mblPictureBox.textDiv.css({ 'margin': '0px', 'padding': '0px' }).hide();
        }

        mblPictureBox.updateNavig();
        mblPictureBox.resizeContainerToFit();
        mblPictureBox.containerCenterInWindow();
    }).error(function() {
        alert('Ekki gekk að hlaða mynd, reynið aftur eða hafið samband við netdeild mbl.is');
        mblPictureBox.hide();
    }).attr('src', link.attr('href'));

    this.countImages();
    this.updateCountDiv();
};

mblPictureBox.countImages = function () {
    this.next_no = 0;
    this.prev_no = 0;

    var currFound = false;
    this.all_links.each(function() {
        if ($(this).attr('href') == mblPictureBox.curr_link.attr('href'))
            currFound = true;
        else if (currFound)
            mblPictureBox.next_no++;
        else
            mblPictureBox.prev_no++;
    });

    this.curr_no = this.prev_no + 1;
    this.count = this.next_no + this.prev_no + 1;
};

mblPictureBox.updateCountDiv = function () {
    if (this.count == 1 || !this.options.show_count)
        this.countDiv.hide();
    else
        this.countDiv.show();

    this.countDiv.html(this.curr_no + " af " + this.count);
};

mblPictureBox.updateNavig = function () {
    if (this.options.show_navigation) {
        if (this.next_no)
            this.nextBtn.show();
        if (this.prev_no)
            this.prevBtn.show();
    }
    else {
        this.nextBtn.hide();
        this.prevBtn.hide();
    }

    if (this.options.show_close)
        this.hideBtn.css('display', 'block');
};

mblPictureBox.keyPressed = function (e) {
    if (!mblPictureBox.options.disable_keyboard)
    {
        // if escape is pressed
        if (e.keyCode == 27) {
            mblPictureBox.hide();
            e.preventDefault();
        }
        // if right arrow key is pressed
        else if (e.keyCode == 37) {
            mblPictureBox.prevBtn.click();
            e.preventDefault();
        }
        // if (39: left arrow key) or (0: space) is pressed
        else if (e.keyCode == 39 || e.keyCode == 0) {
            mblPictureBox.nextBtn.click();
            e.preventDefault();
        }
        // if (27: enter key) is pressed
        // don't do anything, just prevent it
        else if (e.keyCode == 27) {
            e.preventDefault();
        }
    }
};

(function($) {
    $.fn.mblPictureBox = function(user_options) {

        mblPictureBox.init();

        $(window).resize(function() {
            mblPictureBox.overlayFillWindow();
            mblPictureBox.containerCenterInWindow();
        });

        var options = {}

        for (key in mblPictureBox.default_options) {
            if (user_options && user_options[key] != undefined)
                options[key] = user_options[key];
            else
                options[key] = mblPictureBox.default_options[key];
        }

        var all_links = this;

        this.each(function () {
            $(this).click(function () {
                mblPictureBox.curr_link = $(this);
                mblPictureBox.all_links = all_links;
                mblPictureBox.options = options;
                mblPictureBox.show($(this));

                return false;
            });
        });

    };
})(jQuery);
