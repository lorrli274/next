Find the exported genre_create_get() controller method and replace it with the following code. This simply renders the genre_form.pug view, passing a title variable.

// Display Genre create form on GET.
exports.genre_create_get = function(req, res, next) {       
    res.render('genre_form', { title: 'Create Genre' });
};
