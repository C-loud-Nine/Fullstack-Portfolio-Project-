<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexWebForm.aspx.cs" Inherits="Webapp_01.IndexWebForm" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shafi's Portfolio</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="mediaqueries.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>
</head>

<body>

    <section id="home">
    <nav id="desktop-nav">
        <div class="logo">#C-loud-9</div>
        <div>
            <ul class="nav-links">
                <li><a href="#about">About</a></li>
                <li><a href="#experience">Experience</a></li>
                <li><a href="#projects">Projects</a></li>
                <li><a href="#achievements">Achievements</a></li>
                <li><a href="#photography">Photography</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <nav id="hamburger-nav">
        <div class="logo">#C-loud-9</div>
        <div class="hamburger-menu">
          <div class="hamburger-icon" onclick="toggleMenu()">
            <span></span>
            <span></span>
            <span></span>
          </div>
          <div class="menu-links">
                <li><a href="#about" onclick="toggleMenu()">About</a></li>
                <li><a href="#experience" onclick="toggleMenu()">Experience</a></li>
                <li><a href="#projects" onclick="toggleMenu()">Projects</a></li>
                <li><a href="#achievements" onclick="toggleMenu()">Achievements</a></li>
                <li><a href="#photography" onclick="toggleMenu()">Photography</a></li>
                <li><a href="#contact" onclick="toggleMenu()">Contact</a></li>
                <li style="padding-top: 200px;"><a href="#home" onclick="toggleMenu()"><h3><b>Back</b></h3></a></li>


          </div>
        </div>
    </nav>
    </section>

   
    <section id="profile">
    <div class="section__pic-container">
        <img src="./assets/Portfolio dp-modified.png" alt="Shafi DP" />
    </div>
    <div class="section__text">
        <p class="section__text__p1">Hello, I'm</p>
        <h1 class="title">Abdullah Al Shafi</h1>
        <p class="section__text__p2">CS Undergrad, KUET</p>
        <p class="tag">And I'm a<br /><span class="typing"></span></p>
        <div class="btn-container">
            <button class="btn btn-color-2" onclick="window.open('./assets/resume-example.pdf')">Download CV</button>
            <button class="btn btn-color-1" onclick="location.href='./#contact'">Contact Info</button>
        </div>
        <div id="socials-container">
    <asp:Repeater ID="SocialMediaRepeater" runat="server">
        <ItemTemplate>
            <a href='<%# Eval("Link") %>' target="_blank">
                <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("AltText") %>' class="icon" />
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>


    </div>
    </section>


    
    
    
    <section id="about">
      <img src="./assets/arrow_top.png" alt="Arrow icon" class="icon arrow_top" onclick="location.href='./#home'">
      <h1 class="title">About Me</h1>
      <div class="section-container">
          <div class="section__aboutpic-container">
              <img src="./assets/dp21.jpg" alt="Profile Picture" class="about-pic">
          </div>
          <div class="about-details-container">
              <div class="about-container">
                  <div class="details-container animate__animated animate__fadeInUp">
                      <img src="./assets/experience.png" alt="Experience icon" class="icon" />
                      <h3>Experience</h3>
                      <p>1+ years <br/> Student, Computer Science and Engineering</p>
                  </div>
                  <div class="details-container animate__animated animate__fadeInUp">
                      <img src="./assets/education.png" alt="Education icon" class="icon" />
                      <h3>Education</h3>
                      <p>CS Undergrad <br/> Khulna University of Engineering and Technology</p>
                  </div>
              </div>
              <div class="text-container animate__animated animate__fadeInUp">
                  <p class="about-text">
                      I am currently studying as an undergraduate in the Department of Computer Science and Engineering at <b>Khulna University of Engineering & Technology, Bangladesh.</b> I completed my HSC in 2020 under the Science background with a GPA of 5.00 from <b>Dhaka Residential Model College</b>. I completed my SSC from <b>Moulvibazar Govt. High School</b> with a GPA of 5.00.
                      <br><br>
                      Throughout my school and college life, I got the opportunity to participate in multiple Olympiads and extracurricular competitions such as the Math Olympiad, Physics Olympiad, Astrophysics Olympiad, Vasha Protijog, National High School Programming Contest (NHSPC), etc. With multiple regional prizes, I was also able to achieve prizes at the national level <b>5 times</b> overall in multiple Olympiads. From my school days, I was heavily involved in extracurricular activities such as <b>Debate</b>, <b>Quiz</b>, <b>Programming</b>, <b>Photography</b>, <b>Writing</b>, <b>Extempore Speeches</b>, <b>Singing</b>, <b>Drawing</b>, etc. I was also the <b>Founding President</b> of the <b>Debating Club</b> of my school.
                      <br><br>
                      Now, I am conducting my Bachelor's degree in Computer Science and Engineering from Khulna University of Engineering & Technology as a class of 2024. My 2-1 project was on Android App Development named <b>“SimuWallet”</b>, an ATM Simulation built with JAVA.
                      <br><br>
                      My current interests are around <b>Development</b> and <b>Artificial Intelligence</b> and <b>Cyber Security</b>.
                  </p>
              </div>
          </div>
      </div>
      <img src="./assets/arrow.png" alt="Arrow icon" class="icon arrow" onclick="location.href='./#experience'">
  </section>
  



<section id="experience">
    <div class="max-width">
        <h2 class="title">My Expertise</h2>
        <div class="experience-details-container">
            <div class="column_left">
                <div class="text">
                    <strong>My professional experience & projects.</strong>
                    <p>
                        I possess a diverse skill set and have gained valuable experience through various projects and endeavors. Some of my notable projects include:
                    </p>
                    <ul id="Ul1" runat="server" class="Ul1">
                        <!-- Dynamic list items will be inserted here -->
                    </ul>
                    <p>
                        Additionally, I have <strong>C++ expertise</strong> and extensive experience in <strong>competitive programming</strong>, participating in platforms like Codeforces and CodeChef.
                    </p>
                </div>
            </div>
            <div id="column_right" runat="server" class="column_right">
                <!-- This section will be dynamically generated from the code-behind -->
            </div>
        </div>
    </div>
</section>






<<section id="projects">
    <p class="section__text__p1">Explore My Latest</p>
    <h1 class="title">Projects</h1>
    <div class="project-details-container">
        <asp:Repeater ID="ProjectRepeater" runat="server">
            <ItemTemplate>
                <%# Container.ItemIndex % 3 == 0 ? "<div class='about-containers'>" : "" %>
                <div class="details-container color-container">
                    <div class="article-container">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("AltText") %>' class="project-img" />
                    </div>
                    <h2 class="experience-sub-title project-title"><%# Eval("Title") %></h2>
                    <p class="project-description"><%# Eval("Description") %></p>
                    <div class="btn-container">
                        <button class="btn btn-color-2 project-btn" onclick="window.open('<%# Eval("Link") %>')">
                            <span class="btn-text">Github</span>
                            <span class="iconify" data-icon="akar-icons:github-fill"></span>
                        </button>

                    </div>
                </div>
                <%# (Container.ItemIndex + 1) % 3 == 0 || Container.ItemIndex == (Container.DataItem as System.Data.DataRowView).DataView.Count - 1 ? "</div>" : "" %>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <img src="./assets/arrow.png" alt="Arrow icon" class="icon arrow" onclick="location.href='./#contact'" />
</section>






<section id="achievements">
  <h1 class="title">Achievements</h1>
  <div class="experience-details-container">
    <div class="about-containers">
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/nhspc.jpg" alt="NHSPC" class="project-img">
        </div>
        <h1 class="experience-sub-title project-title">National High School Programming Contest</h1>
        <div class="extra-details">
          <p>National High School Programming Contest organised by the government of Bangladesh and hosted by BUET.</p>
          <h2<p><b>6th in national stage</b></p></h2>
          <p>Year: 2015</p>
          <p>Location: National</p>
          <p>Category: Informatics</p>
        </div>
      </div>
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/vasaprotijog.jpg" alt="VASHA PROTIJOG" class="project-img">
        </div>
        <h2 class="experience-sub-title project-title">VASHA PROTIJOG</h2>
        <div class="extra-details">
          <p>Vasa Protijog a language based competetion organised by Prothom Alo and HSBC bank hosted in the KIB.</p>
          <h2<p><b>2nd in national stage</b></p></h2>
          <p>Year: 2017</p>
          <p>Location: National</p>
          <p>Category: Linguistics</p>
        </div>
      </div>
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/space.jpg" alt="Space Olympiad" class="project-img">
        </div>
        <h2 class="experience-sub-title project-title">Space Olympiad</h2>
        <div class="extra-details">
          <p>Space Olympiad hosted by BUET is a competetion in advanced Astrophysics and Cosmology.</p>
          <h2<p><b>2nd in national stage</b></p></h2>
          <p>Year: 2019 , 2020</p>
          <p>Location: National</p>
          <p>Category: Science</p>
        </div>
      </div>
    </div>
  </div>
  <div class="experience-details-container">
    <div class="about-containers">
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/debate.jpg" alt="ISDC" class="project-img">
        </div>
        <h2 class="experience-sub-title project-title">Inter School Debating Cup</h2>
        <div class="extra-details">
          <p>Inter School Debating Cup is a divisionl level group depating competition exceleing oratory skills and logical thinking. </p>
          <h2<p><b>Champions (Best Speaker)</b></p></h2>
          <p>Year: 2017</p>
          <p>Location: State</p>
          <p>Category: Debate</p>
        </div>
      </div>
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/bdjso.jpg" alt="BDJSO" class="project-img">
        </div>
        <h2 class="experience-sub-title project-title">Bangladesh Junior Science Olympiad</h2>
        <div class="extra-details">
          <p>Bangladesh Junior Science Olympiad hovers over all the basic decipline of science like Physics , Chemistry , Biology.</p>
          <h2<p><b>Winner</b></p></h2>
          <p>Year: 2017 , 2018</p>
          <p>Location: Regional</p>
          <p>Category: Science</p>
        </div>
      </div>
      <div class="details-container color-container">
        <div class="article-container">
          <img src="./assets/bdbo.jpg" alt="BDBO" class="project-img">
        </div>
        <h2 class="experience-sub-title project-title">Bangladesh Biology Olympiad</h2>
        <div class="extra-details">
          <p>Bangladesh Biology Olympiades aka BDBO is a olympiad specializing in Biology for IBO.</p>
          <h2<p><b>Regional Winner</b></p></h2>
          <p>Year: 2019 , 2020 , 2021</p>
          <p>Location: Regional</p>
          <p>Category: Science</p>
        </div>
      </div>
    </div>
  </div>
</section>




<section id="photography">
  <h1 class="title">Photography</h1>
  
  <div class="gallery">
    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-19 (2).jpg" alt="Cox's Bazar" class="project-img" />
        <h3 class="photo-title">Cox's Bazar</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-28-49.jpg" alt="Cherapunji" class="project-img" />
        <h3 class="photo-title">Cherapunji</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-18.jpg" alt="Moulvibazar" class="project-img" />
        <h3 class="photo-title">Moulvibazar</h3>
      </div>
    </div>

    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-21.jpg" alt="Daruchini Dip" class="project-img" />
        <h3 class="photo-title">Daruchini Dip</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-16 (2).jpg" alt="Khulna" class="project-img" />
        <h3 class="photo-title">Khulna</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-16.jpg" alt="Cox's Bazar" class="project-img" />
        <h3 class="photo-title">Cox's Bazar</h3>
      </div>
    </div>

    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-23.jpg" alt="Dhaka" class="project-img" />
        <h3 class="photo-title">Dhaka</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-09-21 (2).jpg" alt="Sundarbans" class="project-img" />
        <h3 class="photo-title">Sundarbans</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-28-48 (2).jpg" alt="Nijhum Dip" class="project-img" />
        <h3 class="photo-title">Nijhum Dip</h3>
      </div>
    </div>

    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-28-48.jpg" alt="Sunamgonj" class="project-img" />
        <h3 class="photo-title">Sunamgonj</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-28-50 (2).jpg" alt="Sylhet" class="project-img" />
        <h3 class="photo-title">Sylhet</h3>
      </div>
      <div class="photo">
        <img src="./assets/photo_2024-02-14_04-28-53.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Bangladesh</h3>
      </div>
    </div>
    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/mb.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Countryside</h3>
      </div>
      <div class="photo">
        <img src="./assets/rupsha.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Rupsa River</h3>
      </div>
      <div class="photo">
        <img src="./assets/umbr.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Jaflong</h3>
      </div>
    </div>
    <div class="gallery-row">
      <div class="photo">
        <img src="./assets/stone.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Sadapathor</h3>
      </div>
      <div class="photo">
        <img src="./assets/teknaf.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Teknaf</h3>
      </div>
      <div class="photo">
        <img src="./assets/nodi.jpg" alt="Bangladesh" class="project-img" />
        <h3 class="photo-title">Khulna</h3>
      </div>
    </div>
  </div>
</section>



<section id="contact">
    <img src="./assets/arrow_top.png" alt="Arrow icon" class="icon arrow_top" onclick="location.href='./#home'">
    <p class="scroll__text-top">Top</p>
    <p class="section__text__p1">Get In Touch</p>
    <h1 class="title">Contact Me</h1>

    <div class="contact-content">
        <div class="column left">
            <p class="contant_text_inv">For any information, <b>contact me</b></p>
            <div class="icons">
                <div class="row">
                    <i class="fas fa-user"></i>
                    <div class="info">
                        <div class="sub-title">Abdullah Al Shafi</div>
                    </div>
                </div>
                <div class="row">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="info">
                        <div class="sub-title">Islambag , Moulvibazar, Bangladesh</div>
                    </div>
                </div>
                <div class="row">
                    <i class="fas fa-envelope"></i>
                    <div class="info">
                        <div class="head"><b>Email</b></div>
                        <div class="sub-title">abdullah.shafi99@gmail.com<br>shafi2007055@kuet.ac.bd</div>
                    </div>
                </div>
            </div>
        </div>
       <div class="column right">
        <div class="text">Message me</div>
        <form id="contactForm" runat="server">
            <div class="fields">
                <div class="field name">
                    <asp:TextBox ID="txtName" runat="server" placeholder="Name" required></asp:TextBox>
                </div>
                <div class="field email">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required></asp:TextBox>
                </div>
            </div>
            <div class="field">
                <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject" required></asp:TextBox>
            </div>
            <div class="field textarea">
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="10" placeholder="Message.." required></asp:TextBox>
            </div>
            <div class="btn_container_contact">
                <asp:Button ID="btnSend" runat="server" Text="Send message" CssClass="btn btn-color-1" OnClick="btnSend_Click" />
            </div>
        </form>
    </div>
</div>


    <footer>
        <nav class="footer-nav">
            <div class="nav-links-container">
                <ul class="nav-links">
                    <li><a href="#about">About</a></li>
                    <li><a href="#projects">Projects</a></li>
                    <li><a href="#achievements">Achievements</a></li>
                    <li><a href="#photography">Photography</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
        </nav>
        <p>Copyright &#169; 2024 Abdullah Al Shafi. All Rights Reserved.</p>
    </footer>
</section>


<script src="script.js"></script>
</body>
</html>