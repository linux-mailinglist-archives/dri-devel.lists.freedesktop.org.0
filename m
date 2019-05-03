Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17E12D83
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F82789E3B;
	Fri,  3 May 2019 12:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48D8989E38
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:28:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 45DDD7215A; Fri,  3 May 2019 12:28:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109124] [AMD][TAHITI XT] csgo new battle royal mode bad
 performance
Date: Fri, 03 May 2019 12:28:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-109124-502-K6P3kHK7Vh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109124-502@http.bugs.freedesktop.org/>
References: <bug-109124-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1179364345=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1179364345==
Content-Type: multipart/alternative; boundary="15568865251.6bE7.19795"
Content-Transfer-Encoding: 7bit


--15568865251.6bE7.19795
Date: Fri, 3 May 2019 12:28:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109124

Sylvain BERTRAND <sylvain.bertrand@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|NOTABUG                     |NOTOURBUG

--- Comment #5 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
it does not seem to be the driver, but the 3D engine: I get the same low FPS
while lowering the GPU settings. Seems to be a 3D meshes LOD computation
performance issue in open areas with far sight.
csgo source1 engine seems enough for classic gameplay csgo maps, but quite =
bad
for danger zone gameplay maps (expected).
apex legend 3D engine is actually a heavily modified source1 engine (and th=
ere
are probably map specific optimizations).
I did try the config community mod showed in the video, did not help.
It is said csgo is being upgraded to source2 then vulkan: let's wait and se=
e.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15568865251.6bE7.19795
Date: Fri, 3 May 2019 12:28:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sylvain.b=
ertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertrand&#64;g=
mail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [AMD][TAHITI XT] csgo new battle royal mod=
e bad performance"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109124">bug 10912=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>NOTABUG
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [AMD][TAHITI XT] csgo new battle royal mod=
e bad performance"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109124#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [AMD][TAHITI XT] csgo new battle royal mod=
e bad performance"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109124">bug 10912=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>it does not seem to be the driver, but the 3D engine: I get th=
e same low FPS
while lowering the GPU settings. Seems to be a 3D meshes LOD computation
performance issue in open areas with far sight.
csgo source1 engine seems enough for classic gameplay csgo maps, but quite =
bad
for danger zone gameplay maps (expected).
apex legend 3D engine is actually a heavily modified source1 engine (and th=
ere
are probably map specific optimizations).
I did try the config community mod showed in the video, did not help.
It is said csgo is being upgraded to source2 then vulkan: let's wait and se=
e.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15568865251.6bE7.19795--

--===============1179364345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1179364345==--
