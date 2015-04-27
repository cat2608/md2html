module.exports =

  MARKDOWN:

    HEADING :
      REGEX: /^ *(#{1,6}) *([^<\n]+?) *#* *(?:\n+|$)/
      HTML : '<h1>$2</h1>'

    LINK    :
      REGEX: /\[([^\]]+)\]\(([^)]+)\)/g
      HTML : '<a href="$1">$2</a>'

    STRONG  :
      REGEX: /\*\*([\s\S]+?)\*\*/
      HTML : '<strong>$1</strong>'

    EMPHASIS:
      REGEX: /\*([\s\S]+?)\*/
      HTML : '<em>$1</em>'
