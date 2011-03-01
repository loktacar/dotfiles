(function($) {
    $.fn.mblRenningur = function(options, indicator) {

        var settings = {
          'btn_left_text':              'previous',
          'btn_right_text':             'next',
          'btn_left_class':             'btn_left',
          'btn_right_class':            'btn_right',
          'btn_disabled_class':         'disabled',
          'btn_wrap_inner':             null,
          'viewfinder_class':           '',
          'viewfinder_height':          0,
          'frontmost_element_class':    'front',
          'indicator':                  null,
          'indicator_current_class':    '',
          'center_element':             null,
          'list_moved':                 function() {},
          'scroll_item_count':          'page', // this can also be set to 'page' and it will scroll a whole page at a time
          'animation_speed':            'slow'
        }

        if (options)
            $.extend(settings, options);

        if (indicator)
            settings['indicator'] = indicator;

        this.each(function() {
            var list = $(this);

            // Check if all children are of the same size, if not don't do anything.
            var item_width = list.children().first().outerWidth(true);
            var all_children_same_size = true;

            list.children().each(function () {
                all_children_same_size = $(this).outerWidth(true) == item_width && all_children_same_size;
            });

            if (!all_children_same_size)
                return;

            // Add elements, classes and styles so that the sliding can begin
            list.children().first().addClass(settings['frontmost_element_class']);

            list.before('<a href="#" class="btn">' + settings['btn_left_text'] + '</a>');
            var btn_left = list.prev();
            btn_left.addClass(settings['btn_left_class']);
            btn_left.addClass(settings['btn_disabled_class']);

            list.after('<a href="#" class="btn">' + settings['btn_right_text'] + '</a>');
            var btn_right = list.next();
            btn_right.addClass(settings['btn_right_class']);

            var btns = btn_left.add(btn_right);
            if (settings['btn_wrap_inner'])
                btns.wrapInner(settings['btn_wrap_inner']);

            list.wrap('<div class="viewfinder"></div>');
            var viewfinder = list.parent();
            viewfinder_css = {
                'overflow':     'hidden',
                'position':     'relative'
            };

            if (settings['viewfinder_height'])
                viewfinder_css['height'] = settings['viewfinder_height'] + 'px';

            viewfinder.addClass(settings['viewfinder_class']).css(viewfinder_css);

            list.css({
                'width': '1000000px',
                'position': 'absolute'
            });

            // Set viewfinder height if it isn't set or is 0
            if (viewfinder.css('height') == 'auto' || viewfinder.css('height') == '0px')
                viewfinder.css({ 'height': list.outerHeight(true) + 'px' });

            var indicator = null;
            if (settings['indicator'] && settings['indicator'].length == 1)
                indicator = settings['indicator'];

            var curr_position = null;
            if (indicator)
            {
                indicator.css('overflow', 'hidden');
                if (indicator.css('position') != 'absolute' && indicator.css('position') != 'relative')
                    indicator.css('position', 'relative');
                indicator.append('<div class="curr_position"></div>');
                var curr_position = indicator.find('.curr_position');
                if (settings['indicator_current_class'])
                    curr_position.addClass(settings['indicator_current_class']);
            }

            var visible_items = Math.round(viewfinder.width() / item_width);

            btns.click(function() {
                // find out how many items we are supposed to jump each time the user clicks a button
                var scroll_item_count = settings['scroll_item_count'] == 'page' ? visible_items : settings['scroll_item_count'];

                var front = list.find('.' + settings['frontmost_element_class']);

                if (!front.length)
                    front = list.children().first().addClass(settings['frontmost_element_class']);

                // Now that we've found the frontmost element we have to remove the class
                // and add it to the next/prev element

                // left clicked
                if ($(this).hasClass(settings['btn_left_class']) && front.prevAll().length)
                {
                    front.removeClass(settings['frontmost_element_class']);

                    var new_front = front;
                    for (var i = 0; i < scroll_item_count; i++)
                        if (new_front.prevAll().length)
                            new_front = new_front.prev();

                    new_front.addClass(settings['frontmost_element_class']);
                }
                // right clicked
                else if ($(this).hasClass(settings['btn_right_class']) && (front.nextAll().length+1 - visible_items))
                {
                    front.removeClass(settings['frontmost_element_class']);

                    var new_front = front;
                    for (var i = 0; i < scroll_item_count; i++)
                        if (new_front.nextAll().length+1 > visible_items)
                            new_front = new_front.next();

                    new_front.addClass(settings['frontmost_element_class']);
                }

                // If the class hasn't changed there is nothing to do
                if (front == list.find('.' + settings['frontmost_element_class']))
                    return false;

                front = list.find('.' + settings['frontmost_element_class']);

                // Check if buttons should be disabled
                btns.removeClass(settings['btn_disabled_class']);

                if (!front.prevAll().length)
                    btn_left.addClass(settings['btn_disabled_class']);

                if (!(front.nextAll().length+1 - visible_items))
                    btn_right.addClass(settings['btn_disabled_class']);

                // Do animation
                list.animate({
                    'left': '-' + (front.outerWidth(true) * front.prevAll().length) + 'px' },
                    settings['animation_speed'],
                    function() {
                    eventData = {
                        'beginning': !front.prevAll().length,
                        'end': !(front.nextAll().length+1 - visible_items)
                    };
                    settings['list_moved'].call(list, eventData);
                });

                if (indicator)
                {
                    curr_position.animate({
                        'left': ((indicator.width() - curr_position.width()) / (list.children().length - visible_items)) * front.prevAll().length + 'px'
                    }, settings['animation_speed']);
                }

                return false;
            });

            if (settings['center_element'])
            {
                list.children().removeClass(settings['frontmost_element_class']);
                var front = null;

                var center = settings['center_element'];
                if (center.prevAll().length < visible_items/2)
                    return;
                else if (center.nextAll().length < visible_items/2)
                    return;
                else
                {
                    front = settings['center_element'].addClass('frontmost_element_class');
                }

                if (front)
                    list.css('left', '-' + (front.outerWidth(true) * front.prevAll().length) + 'px');

                if (front && indicator)
                    curr_position.css('left', ((indicator.width() - curr_position.width()) / (list.children().length - visible_items)) * front.prevAll().length + 'px');
            }
        });

        return this;
   };
})(jQuery);
