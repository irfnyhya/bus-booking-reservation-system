<%-- 
    Document   : help
    Created on : 14 Jun 2024, 5:34:48 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet"
              <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Help</title>
    </head>

    <body>
        <header>
            <div class="bottom-bar">
                <div class="bottom-bar__content">
                    <a href="Dashboard.html" class="logo">
                        <img class="logo__img" src="logo.png" alt="logo">
                        <span class="logo__text">Bus Ticket Reservation</span>
                    </a>

                    <nav class="nav">
                        <ul class="nav__list">
                            <li class="nav__item">
                                <a class="nav__link" href="Dashboard.jsp">Dashboard</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="booking.jsp">Booking</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="viewProfile.jsp">Profile</a>
                            </li>
                            <li class="nav__item">
                                <a class="btn" href="Help.html">Help</a>
                            </li>
                        </ul>
                    </nav>

                    <div class="hamburger">
                        <div class="bar"></div>
                        <div class="bar"></div>
                        <div class="bar"></div>
                    </div>
                </div>
            </div>
        </header>


        <main> 
           <div class="container">
            <div class="accordion__wrapper">
                <h1 class="accordion__title">Frequently Asked Questions</h1>
                <!-- Accordion 1 -->
                <div class="accordion">
                    <div class="accordion__header">
                        <h2 class="accordion__question">What is the purpose of this pen?</h2>
                        <span class="accordion__icon">
                            <i class="ri-add-line" id="accordion-icon"></i>
                        </span>
                    </div>
                    <div class="accordion__content">
                        <p class="accordion__answer">This pen is designed to provide web developers with boilerplate code for a FAQ Accordion.</p>
                    </div>
                </div>
                <!-- Accordion 2 -->
                <div class="accordion">
                    <div class="accordion__header">
                        <h2 class="accordion__question">What is an accordion?</h2>
                        <span class="accordion__icon">
                            <i class="ri-add-line" id="accordion-icon"></i>
                        </span>
                    </div>
                    <div class="accordion__content">
                        <p class="accordion__answer">An accordion is a vertically stacked list of headers that users can click on to reveal more information about a business. With an accordion, when someone visits your web page, they will see a list of headers.</p>
                    </div>
                </div>
                <!-- Accordion 3 -->
                <div class="accordion">
                    <div class="accordion__header">
                        <h2 class="accordion__question">How can I customize the accordion?</h2>
                        <span class="accordion__icon">
                            <i class="ri-add-line" id="accordion-icon"></i>
                        </span>
                    </div>
                    <div class="accordion__content">
                        <p class="accordion__answer">You can customize the accordion by modifying the CSS styles and changing the HTML structure as per your needs. You can also add JavaScript to enhance its functionality.</p>
                    </div>
                </div>
                <!-- Accordion 4 -->
                <div class="accordion">
                    <div class="accordion__header">
                        <h2 class="accordion__question">Is this accordion responsive?</h2>
                        <span class="accordion__icon">
                            <i class="ri-add-line" id="accordion-icon"></i>
                        </span>
                    </div>
                    <div class="accordion__content">
                        <p class="accordion__answer">Yes, this accordion is designed to be responsive and will adjust its layout based on the screen size to ensure a good user experience on both desktop and mobile devices.</p>
                    </div>
                </div>
                <!-- Accordion 5 -->
                <div class="accordion">
                    <div class="accordion__header">
                        <h2 class="accordion__question">Can I use this accordion in my project?</h2>
                        <span class="accordion__icon">
                            <i class="ri-add-line" id="accordion-icon"></i>
                        </span>
                    </div>
                    <div class="accordion__content">
                        <p class="accordion__answer">Absolutely! Feel free to use this accordion in your projects. You can modify and adapt it as needed to fit your requirements.</p>
                    </div>
                </div>
            </div>
        </div>
        </main>

        <footer class="footer-distributed">
            <div class="footer-left">
                <img class="logofooter" src="logo.png" alt="logo">

                <p class="footer-links">
                    <a href="#" class="link-1">Dashboard</a>
                    <a href="#">About</a>
                    <a href="#">Booking</a>
                    <a href="#">Help</a>
                </p>
                <p class="footer-company-name">Tiny Travel Co. © 2024</p>
            </div>

            <div class="footer-center">
                <div>
                    <i class="fa fa-map-marker"></i>
                    <p><span>Kuala Nerus</span> Terengganu, Malaysia</p>
                </div>
                <div>
                    <i class="fa fa-phone"></i>
                    <p>+60 123456789</p>
                </div>
                <div>
                    <i class="fa fa-envelope"></i>
                    <p><a href="mailto:tinytravel@company.com">tinytravel@company.com</a></p>
                </div>
            </div>

            <div class="footer-right">
                <p class="footer-company-about">
                    <span>About the company</span>
                    Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu
                    auctor
                    lacus vehicula sit amet.
                </p>
                <div class="footer-icons">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>
                </div>
            </div>
        </footer>



        <script>
            const navEl = document.querySelector('.nav');
            const hamburgerEl = document.querySelector('.hamburger');
            const navItemEls = document.querySelectorAll('.nav__item');

            hamburgerEl.addEventListener('click', () => {
                navEl.classList.toggle('nav--open');
                hamburgerEl.classList.toggle('hamburger--open');
            });

            navItemEls.forEach(navItemEl => {
                navItemEl.addEventListener('click', () => {
                    navEl.classList.remove('nav--open');
                    hamburgerEl.classList.remove('hamburger--open');
                });
            });

            const accordions = document.querySelectorAll(".accordion");
            accordions.forEach((accordion, index) => {
                const header = accordion.querySelector(".accordion__header");
                const content = accordion.querySelector(".accordion__content");
                const icon = accordion.querySelector(".accordion__icon i");
                header.addEventListener("click", () => {
                    const isOpen = content.style.height === `${content.scrollHeight}px`;
                    accordions.forEach((a, i) => {
                        const c = a.querySelector(".accordion__content");
                        const ic = a.querySelector(".accordion__icon i");
                        if (i === index && !isOpen) {
                            c.style.height = `${c.scrollHeight}px`;
                            ic.classList.replace("ri-add-line", "ri-subtract-fill");
                        } else {
                            c.style.height = "0px";
                            ic.classList.replace("ri-subtract-fill", "ri-add-line");
                        }
                    });
                });
            });



        </script>

    </body>
</html>
