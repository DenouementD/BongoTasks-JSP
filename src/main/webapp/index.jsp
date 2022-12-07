<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon"
              href="https://cdn.discordapp.com/attachments/1033251577609342988/1049237421121880124/bongo-cat-drum.gif">
        <title>BongoTasks</title>
    </head>
    <body>
        <jsp:forward page="/TaskServlet/dashboard">
            <jsp:param name="action" value="list"/>
        </jsp:forward>
    </body>
</html>