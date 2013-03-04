## Multilingual Jekyll

A rough draft. The goal is to create a sustainable architecture to manage a site in more than one language.

The current architecture looks like this:

1. Each Jekyll post includes a date with time stamp in its front matter that matches a translated one
2. Interface elements that require translation are set up in the front matter of its template:

        ---
        translations:
          en:
            post-title: 'Posts'
          es:
            post-title: 'Mensajes'
        ---

They are then accessed like  `<h3 class='label'>{{page.translations.[page.lang].post-title}}</h3>` where `[page.lang]`
is a ISO 2 Letter Language code defined in each post.

3. Urls are structured as `permalink: /:categories/:title` and as such, each post must match a category structure in its front matter
that looks something like:

        categories:
         - en
         - blog

Where the first value is the letter language code followed by any others required.

## Cons

- In the language dropdown you need to iterate over {{ for posts in site.posts }} which could get expensive to generate.
- Ensuring categories are set up in the right order is wacky.
- Ensuring the translated post has the same date with timestamp is wacky.
