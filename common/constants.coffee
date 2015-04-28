module.exports =

  MARKDOWN:

    HEADING :
      REGEX: /^ *(#{1,6}) *([^\n]+?) *#* *(?:\n+|$)/gm

    LINK    :
      REGEX: /\[([^\]]+)\]\(([^)]+)\)/g
      HTML : '<a href="$1">$2</a>'

    STRONG  :
      REGEX: /\*\*([^*]+)\*\*/g
      HTML : '<strong>$1</strong>'

    EMPHASIS:
      REGEX: /\*([^*]+)\*/g
      HTML : '<em>$1</em>'
