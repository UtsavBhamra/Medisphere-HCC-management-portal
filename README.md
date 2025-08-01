# MediSphere – All-in-One Portal for Health Care Center Management

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  
  - [About the Project](#about-the-project)
  - [Built With](#built-with)
  - [Video](#video)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [List of Implemented Features](#list-of-implemented-features)
  - [List of Non-Implemented/Planned Features](#list-of-non-implementedplanned-features)
  - [References Used](#references-used)
  - [Other Projects](#other-projects)
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Often, Students have to wait for their turn at the Health Care Center and it is a long process to get the leave/absence letter signed by the authorities to get attendance for classes missed due to medical reasons.

What if this can be done digitally? This is the core idea of the Medisphere portal. The module will allow students to book appointments online based on the Doctor's availability. Additionally, students can generate a leave/absence letter that goes through two levels of approval —first from the HCC in charge and then from the Dean of Student Welfare. The system should notify the relevant approvers when a new leave slip is awaiting approval. Once fully approved, the student will receive a confirmation with the signed leave slip. 

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

### Built With

* [![Rails][Rails]][Rails-url]
* [![Ruby][Ruby]][Ruby-url]
* [![Docker][Docker]][Docker-url]
* [![Nginx][Nginx]][Nginx-url]
* [![TailwindCSS][TailwindCSS]][TailwindCSS-url]
* [![DaisyUI][DaisyUI]][DaisyUI-url]

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- Video -->
## Video

[Video Link](https://drive.google.com/file/d/1-UXFlhJ_S9J-HQar8o3j_atGSXvyf_zZ/view?usp=sharing)

[Video Link (alternate)](https://new.express.adobe.com/id/urn:aaid:sc:AP:df25a095-c0d0-445a-ba83-eb3c713d7d24?invite=true&promoid=Z2G1FQKR&mv=other)

Both the links point to the same video. In case both the links don't work, please contact me through whatsapp/email or any other means.

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

## Getting Started

The prerequisites and installation instructions are listed in this section

### Prerequisites

There are two ways to set up the app- either through docker (this method enables load balancing and other nginx features) or a local setup (better for development as live css reloading is enabled)

#### Docker

1. [Install docker engine](https://docs.docker.com/engine/install/)
2. [Install docker compose](https://docs.docker.com/compose/install/)

#### Local setup

1. Ruby `v3.3.5`
2. Ruby on Rails `v7.2.1`
3. NPM and nodejs
4. A ruby version manager (not compulsory), preferably `rvm` or `rbenv`
 
<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

### Installation

#### Using Docker-compose

1. Clone the repo to your local pc and cd into the directory.
2. Precompile the CSS
```bash
rails assets:precompile
```
3. Enter the following command to fire up all the containers. 
```bash
docker compose up
```
4. Access the application at http://localhost:80

#### Local Setup

1. Clone the repo to your local pc and cd into the directory.
2. Set the ruby version to `v3.3.5` using your version manager.
3. Install dependencies 
```bash
npm install
```
4. Install all the gems in the Gemfile
```bash
bundle install
```
5. Make the migrations
```bash
rails db:migrate
```
6. Pre Compile the CSS 
```bash
rails assets:precompile
```
7. Run the server
```bash
bin/dev
```
8. Access the application at http://localhost:3000

_**Note**: The current docker setup does not support live reloading of CSS. You need to precompile the assets (See step 2 in docker setup) and then rebuild the images and containers for the changes to be reflected. However, this is not an issue with local setup as it uses the bin/dev script_

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- List of Implemented Features -->
## List of Implemented Features

<details>
<summary><strong>Authentication and Authorization</strong></summary>

1. User authentication with the `devise` gem - Allowing users of all 3 roles- teacher, student and dsw to register, log in and logout from the website
2. Authorization and Role Based Access Control- There are three types of users on the site (students, HCC In Charge and DSW), having different permissions

</details>

<details>
<summary><strong>Student Side</strong></summary>

1. Landing page/ Dashboard with links to all features
2. Creation of Appointments by selecting doctor and then selecting time slots from the available ones (for that doctor)
3. Appointment management page to view all appointments
4. Individual Appointment page which shows appointment details and comments from hcc and dsw
5. Leave Letter management page which shows all appointments marked as visited
6. An option is provided to the student to create a leave letter or view existing one for visited appointments
7. Page to View leave letter contains details and comments
8. Form to create leave letter with date picker. If wrong dates are selected, then a notice is displayed to the user.

</details>

<details>
<summary><strong>HCC Side</strong></summary>

1. Landing page/ Dashboard with links to all features
2. Appointments Page to view requested and approved appointments
3. Individual Appointment with details and options to add comments, approve or mark as visited
4. Leave letter page to view requested and forwarded leave letters 
5. Individual leave letter pages to view details and forward/ comment on leave letters
6. Doctors and time slots management page with all controls
7. Forms to add doctors and time slots

</details>

<details>
<summary><strong>DSW Side</strong></summary>

1. Landing page/ Dashboard with links to all features
2. Page to view all leave letters 
3. Page to view individual leave letters and comment/approve the letter

</details>

<details>
<summary><strong>Containerization</strong></summary>

Dockerized the web app to ensure availability across different operating systems and environments and to ensure easy local installation.

</details>

<details>
<summary><strong>Reverse Proxy using Nginx</strong></summary>

1. Load balanced the docker containers
2. Enabled health checks and backup server availability
3. Enabled gzip compression
4. Enabled caching 

</details>

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- List of Non-Implemented/Planned Features -->
## List of Non-Implemented/Planned Features

1. <strong>Improve the UI</strong> - The current frontend is mostly built with HTML, vanilla CSS, JS and Tailwind and has scope for improvement. Dark Mode support also can be added
2. <strong>Implement a pharmacy submodule</strong>, showing list of available medicines, timings etc. We can further scale this up to support online ordering of medicines and then getting it delivered through changepay to hostels.
3. <strong>Implement mailer system</strong> for all functions
4. Add a <strong>dedicated page</strong> to view Doctor's details, specializations and emergency contact numbers.

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- References Used -->
## References Used

* [Rails docs](https://guides.rubyonrails.org/)
* [IRIS Bootcamp](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022)
* [Devise](https://github.com/heartcombo/devise)
* [Tailwind CSS](https://tailwindcss.com/docs/installation)
* [Daisy UI](https://daisyui.com/docs/install/)
* [Docker](https://docs.docker.com/)
* [Nginx](https://www.javatpoint.com/nginx-tutorial)
* [Go Rails YT channel](https://www.youtube.com/@GorailsTV)
* Lots of [Medium](https://medium.com/) and [DEV Community](https://dev.to/) articles 
* [Reddit](https://www.reddit.com/) and [Stack Overflow](https://stackoverflow.com/)

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- Other Projects -->
## Other Projects

1. [ServerLord - Cron Job Monitoring Platform](https://github.com/UtsavBhamra/server-lord)
2. [Course registration Platform with Django](https://github.com/UtsavBhamra/course-registration-platform)
3. [Blog site and Blog migration for IEEE NITK Corpus](https://github.com/UtsavBhamra/ieee_corpus_blog)

<p align="right">(<a href="#medisphere--all-in-one-portal-for-health-care-center-management">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/
[Docker]: https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/
[Nginx]: https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white
[Nginx-url]: https://nginx.org/
[TailwindCSS]: https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white
[TailwindCSS-url]: https://tailwindcss.com/
[DaisyUI]: https://img.shields.io/badge/DaisyUI-5A0EF8?style=for-the-badge&logo=daisyui&logoColor=white
[DaisyUI-url]: https://daisyui.com/