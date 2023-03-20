<%-- 
    Document   : users
    Created on : Mar 12, 2023, 9:25:02 PM
    Author     : Majid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>The Users</title>
                <link rel="stylesheet" type="text/css" href="style.css">
            </head>
    <body>
        <h1>Manage Users</h1>
        <p>        
            <c:if test="${message eq 'update'}">User information updated</c:if>
            <c:if test="${message eq 'empty'}">No users found.</c:if>
            <c:if test="${message eq 'error'}">Sorry, something went wrong.</c:if>
            <c:if test="${message eq 'delete'}">User deleted.</c:if>
            <c:if test="${message eq 'add'}">User added.</c:if>
            </p>

        <c:if test="${message ne 'empty'}">
            <table border="1" cellpadding="5">
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><c:out value="${user.email}"  /></td>
                        <td><c:out value="${user.firstName}"  /></td>
                        <td><c:out value="${user.lastName}"  /></td>
                        <td><c:out value="${user.role.roleName}"  /></td>
                        <td><input type="hidden" name="action" value="edit">
                            <a href="<c:url value='/users?action=edit&amp;'>
                                   <c:param name='email' value='${user.email}'/>  
                               </c:url>">Edit
                            </a></td> 
                        <td><input type="hidden" name="action" value="delete">
                            <a href="<c:url value='/users?action=delete&amp;'> 
                                   <c:param name='email' value='${user.email}'/> 
                               </c:url>"> Delete</a></td>     
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${selectedUser eq null}">
            <form action="users" method="post">
                <h2>Add User</h2> 
                <table>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <input type="text" value="${email}" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First Name:
                        </td>
                        <td>
                            <input type="text" value="${first}" name="first">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name:
                        </td>
                        <td>
                            <input type="text" value="${last}" name="last">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <input type="text" value="${pw}" name="pw">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Role:
                        </td>
                        <td>
                            <select name="role">
                                <option value="1">system admin</option>
                                <option value="2">regular user</option>
                            </select>
                        </td>
                    </tr>
                </table>
                        
                <input type="submit" value="Add user">
                <input type="hidden" name="action" value="add">
            </form>
        </c:if>

        <c:if test="${(message eq 'edit')}">
            <h2>Edit User</h2>
            <form action="users" method="post">
                <table>
                    <tr>
                        <td>
                            Email:
                        </td>
                        <td>
                            <c:out value="${email}"/> <input type="hidden" name="email" value="${email}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First Name:
                        </td>
                        <td>
                            <input type="text" value="${selectedUser.firstName}" name="first">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name:
                        </td>
                        <td>
                            <input type="text" value="${selectedUser.lastName}" name="last">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <input type="text" value="${pw}" name="pw">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Role:
                        </td>
                        <td>
                             <select name="role">                  
                    <c:choose>
                        <c:when test="${selectedUser.role.getRoleId() == 1}" >                                  
                            <option>system admin</option> 
                            <option>regular user</option>
                        </c:when>
                        <c:otherwise>
                            <option>regular user</option> 
                            <option>system admin</option>
                        </c:otherwise>
                    </c:choose>                            
                </select>
                        </td>
                    </tr>
                </table>                
                
                <input type="submit" value="Update">
                <input type="hidden" name="action" value="update">
                <a href="/Week7_MVC/"><input type="button" value="Cancel">
                    <input type="hidden" name="action" value="cancel"></a> 
                </c:if>
            <p>
                ${mes}
            </p> 
    </body>
</html>