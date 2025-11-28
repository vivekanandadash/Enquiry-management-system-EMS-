<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>
        body { font-family: 'Poppins', sans-serif; }
    </style>
</head>

<!-- Body: Fixed height (h-screen) with overflow hidden to prevent scrolling -->
<body class="bg-gradient-to-br from-indigo-900 to-purple-800 h-screen w-screen flex flex-col overflow-hidden">

    <!-- Include Menu (Navbar) -->
    <div class="flex-shrink-0">
        <jsp:include page="Menu.jsp" />
    </div>

    <!-- Main Content: Centered in remaining space -->
    <div class="flex-grow flex items-center justify-center p-2">
        
        <!-- Registration Card (Split Layout) -->
        <div class="bg-white rounded-xl shadow-2xl w-full max-w-4xl flex overflow-hidden" style="max-height: 90vh;">
            
            <!-- LEFT SIDE: Form Area (60% width) -->
            <div class="w-full md:w-3/5 p-6 md:p-8 overflow-y-auto">
                
                <h2 class="text-xl font-bold text-purple-700 uppercase tracking-wide text-center mb-1">New Registration</h2>
                <p class="text-gray-400 text-xs text-center mb-5">Enter student details below</p>

                <form action="registration" method="post" class="space-y-3">
                    
                    <!-- Name -->
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-user text-xs text-gray-400"></i>
                        </div>
                        <input type="text" name="name" title="Enter your name" placeholder="Full Name"
                            class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2 pl-9 pr-4 focus:outline-none focus:ring-1 focus:ring-purple-400 placeholder-gray-400">
                    </div>

                    <!-- Email -->
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-envelope text-xs text-gray-400"></i>
                        </div>
                        <input type="text" name="email" required placeholder="Email Address"
                            class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2 pl-9 pr-4 focus:outline-none focus:ring-1 focus:ring-purple-400 placeholder-gray-400">
                    </div>

                    <!-- Number -->
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-phone text-xs text-gray-400"></i>
                        </div>
                        <input type="text" name="number" placeholder="Mobile Number"
                            class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2 pl-9 pr-4 focus:outline-none focus:ring-1 focus:ring-purple-400 placeholder-gray-400">
                    </div>

                    <!-- Course -->
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-graduation-cap text-xs text-gray-400"></i>
                        </div>
                        <input type="text" name="course" placeholder="Course Name"
                            class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2 pl-9 pr-4 focus:outline-none focus:ring-1 focus:ring-purple-400 placeholder-gray-400">
                    </div>

                    <!-- Submit Button -->
                    <div class="pt-2">
                        <input type="submit" value="Register Now" 
                            class="w-full bg-gradient-to-r from-purple-500 to-indigo-600 text-white font-bold text-sm py-2.5 rounded-full shadow-md hover:shadow-lg hover:from-purple-600 hover:to-indigo-700 transition transform hover:-translate-y-0.5 cursor-pointer">
                    </div>

                </form>

                <!-- Mobile Only: Result Message (Shows below form only on small screens) -->
                <div class="md:hidden mt-4">
                     <% if(request.getAttribute("result") != null) { %>
                        <div class="text-center text-xs text-purple-700 font-semibold bg-purple-100 p-2 rounded">
                            <%= request.getAttribute("result") %>
                        </div>
                    <% } %>
                </div>

            </div>

            <!-- RIGHT SIDE: Result/Status Panel (40% width) -->
            <!-- Visible on tablet/desktop only -->
            <div class="hidden md:flex w-2/5 bg-gradient-to-br from-blue-600 via-purple-500 to-orange-400 p-6 flex-col justify-center items-center text-center text-white relative">
                
                <!-- If there is a result from the server, show it here -->
                <% 
                String msg = (String) request.getAttribute("result");
                if(msg != null && !msg.isEmpty()) { 
                %>
                    <!-- Success/Error View -->
                    <div class="bg-white/20 backdrop-blur-md p-6 rounded-xl border border-white/30 shadow-lg animate-pulse">
                        <i class="fa-solid fa-bell text-3xl mb-3 text-yellow-300"></i>
                        <h3 class="text-lg font-bold mb-2">Notification</h3>
                        <p class="text-sm font-medium"><%= msg %></p>
                    </div>
                <% 
                } else { 
                %>
                    <!-- Default View (When no message) -->
                    <div class="opacity-90">
                        <div class="bg-white/10 p-4 rounded-full inline-block mb-4">
                            <i class="fa-solid fa-user-plus text-3xl"></i>
                        </div>
                        <h3 class="text-xl font-bold mb-2">Join Us Today</h3>
                        <p class="text-xs text-purple-100 leading-relaxed">
                            Create an account to manage enquiries efficiently. Safe, secure, and fast.
                        </p>
                    </div>
                <% 
                } 
                %>
                
                <!-- Abstract decorative circle -->
                <div class="absolute bottom-0 right-0 w-24 h-24 bg-white opacity-10 rounded-tl-full"></div>
            </div>

        </div>
    </div>

</body>
</html>