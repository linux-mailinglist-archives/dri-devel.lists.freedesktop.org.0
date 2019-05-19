Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE0225B7
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 04:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597B890BC;
	Sun, 19 May 2019 02:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF746890C7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 02:35:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ABE8372167; Sun, 19 May 2019 02:35:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107612] [Vega10] Hard Lock [gfxhub] VMC page fault when opening
 Mario Kart 8 in Cemu under wine
Date: Sun, 19 May 2019 02:35:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mesa@suchmail.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-107612-502-GdNMZAmjeZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107612-502@http.bugs.freedesktop.org/>
References: <bug-107612-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1252598512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1252598512==
Content-Type: multipart/alternative; boundary="15582333433.474841c.18350"
Content-Transfer-Encoding: 7bit


--15582333433.474841c.18350
Date: Sun, 19 May 2019 02:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107612

CheatCodesOfLife <mesa@suchmail.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from CheatCodesOfLife <mesa@suchmail.net> ---
I jumpped ship to nvidia months ago so this doesn't help me, but for you gu=
ys
following this thread, the Cemu developers managed to fix this issue. If you
install the latest public release of Cemu, it will work with Vega + mesa un=
der
wine.

The latest mesa build also fixes the BOTW texture problem.

So latest Cemu + latest mesa works perfectly with Vega cards now.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582333433.474841c.18350
Date: Sun, 19 May 2019 02:35:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mesa&#64;=
suchmail.net" title=3D"CheatCodesOfLife &lt;mesa&#64;suchmail.net&gt;"> <sp=
an class=3D"fn">CheatCodesOfLife</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Vega10] Hard Lock [gfxhub] VMC page fault whe=
n opening Mario Kart 8 in Cemu under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107612">bug 10761=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Vega10] Hard Lock [gfxhub] VMC page fault whe=
n opening Mario Kart 8 in Cemu under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107612#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Vega10] Hard Lock [gfxhub] VMC page fault whe=
n opening Mario Kart 8 in Cemu under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107612">bug 10761=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mesa&#64;suchmail.net" title=3D"CheatCodesOfLife &lt;mesa&#64;suchmail.net&=
gt;"> <span class=3D"fn">CheatCodesOfLife</span></a>
</span></b>
        <pre>I jumpped ship to nvidia months ago so this doesn't help me, b=
ut for you guys
following this thread, the Cemu developers managed to fix this issue. If you
install the latest public release of Cemu, it will work with Vega + mesa un=
der
wine.

The latest mesa build also fixes the BOTW texture problem.

So latest Cemu + latest mesa works perfectly with Vega cards now.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582333433.474841c.18350--

--===============1252598512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1252598512==--
