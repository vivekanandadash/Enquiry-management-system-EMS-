<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- CUSTOM FAVICON: Matches your Indigo/Purple Theme -->
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Cdefs%3E%3ClinearGradient id='grad' x1='0%25' y1='0%25' x2='100%25' y2='100%25'%3E%3Cstop offset='0%25' style='stop-color:%234338ca;stop-opacity:1' /%3E%3Cstop offset='100%25' style='stop-color:%237e22ce;stop-opacity:1' /%3E%3C/linearGradient%3E%3C/defs%3E%3Crect width='32' height='32' rx='10' fill='url(%23grad)'/%3E%3Ccircle cx='16' cy='10' r='5' fill='white'/%3E%3Cpath d='M16 17 c-6 0 -11 4 -11 9 v1 h22 v-1 c0 -5 -5 -9 -11 -9 z' fill='white'/%3E%3C/svg%3E">

    <style>
        body { font-family: 'Poppins', sans-serif; }
    </style>
</head>
<!-- Body: Fixed height (h-screen) and overflow hidden to prevent scrolling -->
<body class="bg-gradient-to-br from-indigo-900 to-purple-800 h-screen w-screen flex items-center justify-center overflow-hidden">

    <!-- Card Container: Reduced max-width to 3xl (smaller) and rounded corners -->
    <div class="bg-white rounded-xl shadow-2xl flex w-full max-w-3xl overflow-hidden transform scale-100 transition-all">

        <!-- LEFT SIDE: Welcome Gradient Panel -->
        <!-- Reduced padding (p-8) and text sizes -->
        <div class="hidden md:flex w-1/2 bg-gradient-to-br from-blue-600 via-purple-500 to-orange-400 p-8 flex-col justify-center text-white relative">
            
            <h1 class="text-3xl font-bold mb-3">Welcome Back</h1>
            <p class="text-purple-100 text-xs leading-relaxed mb-4 opacity-90">
                Log in to access your enquiry management dashboard. Secure, fast, and easy to use.
            </p>
            
            <!-- Abstract decor -->
            <div class="absolute bottom-0 left-0 w-full h-20 bg-gradient-to-t from-black/10 to-transparent"></div>
        </div>

        <!-- RIGHT SIDE: Login Form -->
        <!-- Compact padding (p-8) -->
        <div class="w-full md:w-1/2 p-8 bg-white flex flex-col justify-center">
            
            <h2 class="text-xl font-bold text-center text-purple-700 mb-6 uppercase tracking-wide">User Login</h2>

            <form action="logins" method="post" class="space-y-4">
                
                <!-- Email/User Input -->
                <div class="relative group">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-4 w-4 text-gray-400 group-focus-within:text-purple-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                    </div>
                    <!-- Reduced padding (py-2) -->
                    <input type="text" name="email" required placeholder="Username"
                        class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2.5 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-purple-400 transition shadow-sm placeholder-gray-400">
                </div>

                <!-- Password Input -->
                <div class="relative group">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-4 w-4 text-gray-400 group-focus-within:text-purple-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                        </svg>
                    </div>
                    <!-- Reduced padding (py-2) -->
                    <input type="password" name="password" required placeholder="Password"
                        class="w-full bg-purple-50 text-gray-700 text-sm border-none rounded-full py-2.5 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-purple-400 transition shadow-sm placeholder-gray-400">
                </div>

                <!-- Options -->
                <div class="flex items-center justify-between text-xs text-gray-500 px-1">
                    <label class="flex items-center space-x-1 cursor-pointer">
                        <input type="checkbox" class="rounded text-purple-600 focus:ring-purple-500">
                        <span>Remember me</span>
                    </label>
                    <a href="#" class="hover:text-purple-600 transition">Forgot password?</a>
                </div>

                <!-- Login Button -->
                <div class="pt-2">
                    <input type="submit" value="LOGIN" 
                        class="w-full bg-gradient-to-r from-purple-500 to-indigo-600 text-white font-bold text-sm py-2.5 rounded-full shadow-md hover:shadow-lg hover:from-purple-600 hover:to-indigo-700 transition transform hover:-translate-y-0.5 cursor-pointer">
                </div>
            </form>

            <!-- Error Message -->
            <% 
            if(request.getAttribute("result") != null) {
            %>
                <div class="mt-4 text-center">
                    <span class="text-red-500 text-xs bg-red-50 py-1 px-3 rounded-full border border-red-100">
                        <%= request.getAttribute("result") %>
                    </span>
                </div>
            <% 
            } 
            %>

        </div>
    </div>

</body>
</html>