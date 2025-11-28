<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Details</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>
        body { font-family: 'Poppins', sans-serif; }
    </style>
</head>

<!-- Body: Flex layout with fixed height. 
     Added 'overflow-y-auto' to allow scrolling ONLY if screen is extremely small, ensuring nothing gets cut off. -->
<body class="bg-gradient-to-br from-indigo-900 to-purple-800 h-screen w-screen flex flex-col overflow-hidden">

    <!-- Include Menu -->
    <div class="flex-shrink-0 z-10">
        <jsp:include page="Menu.jsp" />
    </div>

    <!-- Main Content: Centered -->
    <!-- Added overflow-y-auto here so if the screen is tiny, you can scroll to see the error -->
    <div class="flex-grow flex items-center justify-center p-2 overflow-y-auto">
        
        <!-- Update Card: Very Compact (max-w-[280px]) -->
        <div class="bg-white rounded-lg shadow-2xl w-full max-w-[280px] sm:max-w-[300px] p-4 relative">
            
            <!-- Header: Ultra Compact -->
            <div class="text-center mb-3">
                <div class="bg-purple-100 text-purple-600 w-8 h-8 rounded-full flex items-center justify-center mx-auto mb-1 text-sm">
                    <i class="fa-solid fa-user-pen"></i>
                </div>
                <h2 class="text-base font-bold text-gray-800 uppercase tracking-wide">Update Details</h2>
            </div>

            <!-- Form: Tight Spacing (space-y-2) -->
            <form action="UpdateRegistration" method="post" class="space-y-2">
                
                <!-- Email Input (Read Only) -->
                <div>
                    <label class="block text-[10px] font-bold text-gray-400 ml-3 uppercase">Email</label>
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-envelope text-gray-400 text-[10px]"></i>
                        </div>
                        <!-- Thinner Input (py-1.5) -->
                        <input type="text" name="email" value="<%=request.getAttribute("email")%>" 
                            class="w-full bg-gray-100 text-gray-600 border border-gray-200 rounded-full py-1.5 pl-8 pr-3 focus:outline-none transition text-xs font-medium cursor-not-allowed"
                            readonly>
                    </div>
                </div>

                <!-- Number Input (Editable) -->
                <div>
                    <label class="block text-[10px] font-bold text-gray-400 ml-3 uppercase">Mobile</label>
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa-solid fa-phone text-purple-500 text-[10px]"></i>
                        </div>
                        <!-- Thinner Input (py-1.5) -->
                        <input type="text" name="number" value="<%=request.getAttribute("number")%>" 
                            class="w-full bg-purple-50 text-gray-800 border-none rounded-full py-1.5 pl-8 pr-3 focus:outline-none focus:ring-1 focus:ring-purple-500 transition shadow-sm placeholder-gray-400 text-xs font-bold">
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="pt-2">
                    <input type="submit" value="Update" 
                        class="w-full bg-gradient-to-r from-purple-500 to-indigo-600 text-white font-bold text-xs py-2 rounded-full shadow-md hover:shadow-lg hover:from-purple-600 hover:to-indigo-700 transition transform hover:-translate-y-0.5 cursor-pointer">
                </div>

            </form>

            <!-- Server Response Message -->
            <!-- Positioned to ensure visibility -->
            <% 
            if(request.getAttribute("result") != null) {
            %>
                <div class="mt-3 text-center animate-pulse">
                    <span class="inline-block bg-red-50 text-red-600 text-[10px] font-semibold px-2 py-1 rounded border border-red-200 shadow-sm break-words max-w-full">
                        <i class="fa-solid fa-circle-exclamation mr-1"></i> <%= request.getAttribute("result") %>
                    </span>
                </div>
            <% 
            } 
            %>

        </div>
    </div>

</body>
</html>