module.exports =

  MARKDOWN:
    LINK    : /\[([^\]]+)\]\(([^)]+)\)/g
    HEADING : /^ *(#{1,6}) *([^<\n]+?) *#* *(?:\n+|$)/
    CODE    : /\`(.*?)\`/g
    STRONG  : /\*\*([\s\S]+?)\*\*/
    EMPHASIS: /\*([\s\S]+?)\*/
