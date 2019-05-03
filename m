Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08A13659
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 01:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25336892D5;
	Fri,  3 May 2019 23:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0145892D5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 23:50:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E218E7215A; Fri,  3 May 2019 23:50:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Fri, 03 May 2019 23:50:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supercoolemail@seznam.cz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-xfNrQmsgrE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0454976920=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0454976920==
Content-Type: multipart/alternative; boundary="15569274240.a28c67eA.7919"
Content-Transfer-Encoding: 7bit


--15569274240.a28c67eA.7919
Date: Fri, 3 May 2019 23:50:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #13 from supercoolemail@seznam.cz ---
You are lucky. I have this:
https://imgur.com/a/YTDyAXv
Notice, that this is with vastly limited object rendering distance, which m=
akes
fights rather difficult - I can't even see who is shooting at me with a bow.
And there are places like forests that cause massive FPS drops. With higher
object rendering distance I get around 15 FPS, but dropping below that in c=
ity
and farms.

Then there is that problem with software rendering giving better performance
than RX 580. That does not seem right to me (and is main reason why I report
this here and not to wine).

And that I have to wait 5 seconds after each menu action to see what is
highlighted or shown. It takes even more time in more complex menus, such as
keybiding. And this is workaroundable by LIBGL_ALWAYS_SOFTWARE=3D1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569274240.a28c67eA.7919
Date: Fri, 3 May 2019 23:50:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
supercoolemail&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">superc=
oolemail&#64;seznam.cz</a>
</span></b>
        <pre>You are lucky. I have this:
<a href=3D"https://imgur.com/a/YTDyAXv">https://imgur.com/a/YTDyAXv</a>
Notice, that this is with vastly limited object rendering distance, which m=
akes
fights rather difficult - I can't even see who is shooting at me with a bow.
And there are places like forests that cause massive FPS drops. With higher
object rendering distance I get around 15 FPS, but dropping below that in c=
ity
and farms.

Then there is that problem with software rendering giving better performance
than RX 580. That does not seem right to me (and is main reason why I report
this here and not to wine).

And that I have to wait 5 seconds after each menu action to see what is
highlighted or shown. It takes even more time in more complex menus, such as
keybiding. And this is workaroundable by LIBGL_ALWAYS_SOFTWARE=3D1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569274240.a28c67eA.7919--

--===============0454976920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0454976920==--
