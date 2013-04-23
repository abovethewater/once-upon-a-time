once-upon-a-time
================

Once upon a time Sinatra test app

## TODO

* refactor for de-duplication
* validate input
* validate ids
* validate text on render
* general tidy

### worth noting
<script>setTextInLocation(<%=location%>, <%=@page_id.to_s%>, <%= @page_content.send(location) %>);</script>