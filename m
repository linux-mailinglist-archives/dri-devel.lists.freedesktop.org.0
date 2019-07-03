Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8E5EAEE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 19:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2947A6E18F;
	Wed,  3 Jul 2019 17:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFF3F6E182
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 17:53:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DA5A872167; Wed,  3 Jul 2019 17:53:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106224] "Medieval 2 Total War" will sometimes crash system on a
 R9 270 card
Date: Wed, 03 Jul 2019 17:53:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johnz@lunarg.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-106224-502-7FfUYzknI1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-106224-502@http.bugs.freedesktop.org/>
References: <bug-106224-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2117414264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2117414264==
Content-Type: multipart/alternative; boundary="15621764261.69EceD.15612"
Content-Transfer-Encoding: 7bit


--15621764261.69EceD.15612
Date: Wed, 3 Jul 2019 17:53:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106224

LunarG <johnz@lunarg.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from LunarG <johnz@lunarg.com> ---
Started the game with Mesa 18.3.6 on an R9 270 card and was not able to
reproduce the issue. Closing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621764261.69EceD.15612
Date: Wed, 3 Jul 2019 17:53:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:johnz&#64=
;lunarg.com" title=3D"LunarG &lt;johnz&#64;lunarg.com&gt;"> <span class=3D"=
fn">LunarG</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - &quot;Medieval 2 Total War&quot; will sometime=
s crash system on a R9 270 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106224">bug 10622=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEEDINFO
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
   title=3D"RESOLVED FIXED - &quot;Medieval 2 Total War&quot; will sometime=
s crash system on a R9 270 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106224#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - &quot;Medieval 2 Total War&quot; will sometime=
s crash system on a R9 270 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106224">bug 10622=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
johnz&#64;lunarg.com" title=3D"LunarG &lt;johnz&#64;lunarg.com&gt;"> <span =
class=3D"fn">LunarG</span></a>
</span></b>
        <pre>Started the game with Mesa 18.3.6 on an R9 270 card and was no=
t able to
reproduce the issue. Closing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621764261.69EceD.15612--

--===============2117414264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2117414264==--
