Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE3811AD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 07:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5012389DA8;
	Mon,  5 Aug 2019 05:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20E4189DA8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 05:36:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 16C1372168; Mon,  5 Aug 2019 05:36:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105282] Divinity: Original Sin Enhanced Edition blocky and
 jagged shadows.
Date: Mon, 05 Aug 2019 05:36:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-105282-502-GBsbWxFToz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105282-502@http.bugs.freedesktop.org/>
References: <bug-105282-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2065878679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2065878679==
Content-Type: multipart/alternative; boundary="15649833940.baD04DfB.22451"
Content-Transfer-Encoding: 7bit


--15649833940.baD04DfB.22451
Date: Mon, 5 Aug 2019 05:36:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105282

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Timothy Arceri <t_arceri@yahoo.com.au> ---
Should be fixed by:

commit 3c9144f9e5888e9a31886b64168f63e991da01d0
Author: Timothy Arceri <tarceri@itsqueeze.com>
Date:   Fri Aug 2 10:05:20 2019 +1000

    drirc: Add discard workaround for Divinity: Original Sin EE

    This adds an additional work around for the game to fix the blocky
    shadows as reported in bug 105282

    Acked-by: Eric Engestrom <eric.engestrom@intel.com>
    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D105282

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649833940.baD04DfB.22451
Date: Mon, 5 Aug 2019 05:36:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Divinity: Original Sin Enhanced Edition blocky=
 and jagged shadows."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105282">bug 10528=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Divinity: Original Sin Enhanced Edition blocky=
 and jagged shadows."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105282#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Divinity: Original Sin Enhanced Edition blocky=
 and jagged shadows."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105282">bug 10528=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>Should be fixed by:

commit 3c9144f9e5888e9a31886b64168f63e991da01d0
Author: Timothy Arceri &lt;<a href=3D"mailto:tarceri&#64;itsqueeze.com">tar=
ceri&#64;itsqueeze.com</a>&gt;
Date:   Fri Aug 2 10:05:20 2019 +1000

    drirc: Add discard workaround for Divinity: Original Sin EE

    This adds an additional work around for the game to fix the blocky
    shadows as reported in <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Divinity: Original Sin Enhanced Edition blocky=
 and jagged shadows."
   href=3D"show_bug.cgi?id=3D105282">bug 105282</a>

    Acked-by: Eric Engestrom &lt;<a href=3D"mailto:eric.engestrom&#64;intel=
.com">eric.engestrom&#64;intel.com</a>&gt;
    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Divinity: Original Sin Enhanced Edition blocky=
 and jagged shadows."
   href=3D"show_bug.cgi?id=3D105282">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105282</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649833940.baD04DfB.22451--

--===============2065878679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2065878679==--
