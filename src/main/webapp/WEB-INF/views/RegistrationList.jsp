<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration List</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>
        body { font-family: 'Poppins', sans-serif; }
    </style>
</head>

<!-- Body: Matches Application Theme -->
<body class="bg-gradient-to-br from-indigo-900 to-purple-800 min-h-screen text-gray-800 font-sans">

    <!-- Include Menu -->
    <jsp:include page="Menu.jsp" />

    <!-- Main Container: Constrained width to prevent over-stretching -->
    <div class="container mx-auto px-2 py-6 max-w-5xl">
        
        <!-- Table Card -->
        <div class="bg-white rounded-xl shadow-xl overflow-hidden">
            
            <!-- Compact Header Section -->
            <div class="bg-gray-50 px-5 py-3 border-b border-gray-200 flex justify-between items-center">
                <div class="flex items-center gap-2">
                    <div class="bg-indigo-100 p-2 rounded-full text-indigo-600">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div>
                        <h2 class="text-lg font-bold text-indigo-800 leading-tight">Registration List</h2>
                        <p class="text-xs text-gray-500">All Students</p>
                    </div>
                </div>
                <!-- Add New Button -->
                <a href="registration" class="bg-indigo-600 hover:bg-indigo-700 text-white text-xs font-bold py-1.5 px-3 rounded shadow transition duration-300 flex items-center gap-1">
                    <i class="fa-solid fa-plus"></i> <span class="hidden sm:inline">New</span>
                </a>
            </div>

            <!-- Table Wrapper -->
            <!-- overflow-x-auto handles mobile, but compact styling prevents scroll on desktop -->
            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    
                    <!-- Table Head -->
                    <thead>
                        <tr class="bg-indigo-50 text-indigo-800 text-xs uppercase tracking-wider">
                            <th class="p-3 font-bold border-b border-indigo-100">Name</th>
                            <th class="p-3 font-bold border-b border-indigo-100">Email</th>
                            <th class="p-3 font-bold border-b border-indigo-100">Mobile</th>
                            <th class="p-3 font-bold border-b border-indigo-100">Course</th>
                            <th class="p-3 font-bold border-b border-indigo-100 text-center">Action</th>
                        </tr>
                    </thead>

                    <!-- Table Body -->
                    <tbody class="text-sm divide-y divide-gray-100">
                        <% 
                        ResultSet result = (ResultSet)request.getAttribute("result");
                        if(result != null) {
                            while(result.next()){
                                String name = result.getString(1);
                                String email = result.getString(2);
                                String number = result.getString(3);
                                String course = result.getString(4);
                                // Initials for Avatar
                                String initial = (name != null && !name.isEmpty()) ? name.substring(0,1).toUpperCase() : "U";
                        %>
                        <tr class="hover:bg-purple-50 transition duration-150 group">
                            
                            <!-- Name & Avatar -->
                            <td class="p-3">
                                <div class="flex items-center gap-3">
                                    <div class="h-8 w-8 rounded-full bg-indigo-100 text-indigo-600 flex items-center justify-center text-xs font-bold border border-indigo-200 shrink-0">
                                        <%= initial %>
                                    </div>
                                    <span class="font-semibold text-gray-700 whitespace-nowrap"><%= name %></span>
                                </div>
                            </td>

                            <!-- Email (Allowed to wrap lightly or truncated) -->
                            <td class="p-3 text-gray-600 max-w-[150px] truncate" title="<%= email %>">
                                <%= email %>
                            </td>

                            <!-- Number -->
                            <td class="p-3">
                                <span class="bg-green-50 text-green-700 py-0.5 px-2 rounded text-xs font-medium border border-green-100 whitespace-nowrap">
                                    <%= number %>
                                </span>
                            </td>

                            <!-- Course -->
                            <td class="p-3 text-gray-600 text-xs">
                                <%= course %>
                            </td>

                            <!-- Actions -->
                            <td class="p-3 text-center">
                                <div class="flex items-center justify-center gap-3">
                                    <!-- Update -->
                                    <a href="UpdateRegistration?email=<%= email %>&number=<%= number %>" 
                                       class="text-blue-500 hover:text-blue-700 transition" title="Edit">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <!-- Delete -->
                                    <a href="DeleteRegistration?email=<%= email %>" 
                                       class="text-red-400 hover:text-red-600 transition" title="Delete"
                                       onclick="return confirm('Delete user <%= name %>?');">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% 
                            }
                        } else { 
                        %>
                        <!-- Empty State -->
                        <tr>
                            <td colspan="5" class="p-8 text-center text-gray-400">
                                <div class="flex flex-col items-center">
                                    <i class="fa-solid fa-inbox text-3xl mb-2 opacity-50"></i>
                                    <span class="text-sm">No registrations found</span>
                                </div>
                            </td>
                        </tr>
                        <% 
                        } 
                        %>
                    </tbody>
                </table>
            </div>
            
            <!-- Footer -->
            <div class="bg-gray-50 p-2 text-center text-[10px] text-gray-400 border-t border-gray-100">
                End of Records
            </div>

        </div>
    </div>

</body>
</html>