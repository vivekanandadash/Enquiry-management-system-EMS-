<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Tailwind CSS (Ensures styles load if parent page misses it) -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Font Awesome for Icons (Optional but looks good) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

<!-- Navigation Bar -->
<nav class="bg-gradient-to-r from-indigo-900 to-purple-800 shadow-lg w-full">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row justify-between items-center h-auto md:h-16 py-3 md:py-0">
            
            <!-- Logo / Brand Name -->
            <div class="flex-shrink-0 mb-3 md:mb-0">
                <a href="#" class="text-white font-bold text-xl tracking-wider flex items-center gap-2">
                    <i class="fa-solid fa-layer-group"></i> EnquirySys
                </a>
            </div>

            <!-- Navigation Links -->
            <div class="flex flex-wrap justify-center gap-6 items-center">
                
                <!-- Registration Form Link -->
                <a href="registration" class="text-gray-300 hover:text-white hover:bg-white/10 px-3 py-2 rounded-md text-sm font-medium transition duration-300">
                    <i class="fa-solid fa-pen-to-square mr-1"></i> New Registration
                </a>

                <!-- Registration List Link -->
                <a href="registrationList" class="text-gray-300 hover:text-white hover:bg-white/10 px-3 py-2 rounded-md text-sm font-medium transition duration-300">
                    <i class="fa-solid fa-list mr-1"></i> Registration List
                </a>

                <!-- Logout Button (Inside Form) -->
                <form action="logout" method="post" class="ml-0 md:ml-4">
                    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-full text-sm font-medium shadow-md transition transform hover:scale-105 flex items-center gap-2">
                        <i class="fa-solid fa-right-from-bracket"></i> Logout
                    </button>
                </form>
                
            </div>
        </div>
    </div>
</nav>