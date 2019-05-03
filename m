Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70F1339B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 20:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6D589C21;
	Fri,  3 May 2019 18:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8881B89C21
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 18:27:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7C41A7215A; Fri,  3 May 2019 18:27:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108750] Glitchy Interface on Origin when using radeonsi and
 wined3d
Date: Fri, 03 May 2019 18:27:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hverbeet@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108750-502-6AKQu1T8Yk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108750-502@http.bugs.freedesktop.org/>
References: <bug-108750-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1114421422=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1114421422==
Content-Type: multipart/alternative; boundary="15569080640.6dDC.27588"
Content-Transfer-Encoding: 7bit


--15569080640.6dDC.27588
Date: Fri, 3 May 2019 18:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108750

--- Comment #2 from Henri Verbeet <hverbeet@gmail.com> ---
(In reply to Timothy Arceri from comment #1)
> wined3d DX11 support is known to be very buggy. Just use dxvk.

With DXVK effectively being a Valve project I can understand your personal
preference, but I hope that's not Mesa's position.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569080640.6dDC.27588
Date: Fri, 3 May 2019 18:27:44 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Glitchy Interface on Origin when using rad=
eonsi and wined3d"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108750#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Glitchy Interface on Origin when using rad=
eonsi and wined3d"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108750">bug 10875=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hverbeet&#64;gmail.com" title=3D"Henri Verbeet &lt;hverbeet&#64;gmail.com&g=
t;"> <span class=3D"fn">Henri Verbeet</span></a>
</span></b>
        <pre>(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D=
108750#c1">comment #1</a>)
<span class=3D"quote">&gt; wined3d DX11 support is known to be very buggy. =
Just use dxvk.</span >

With DXVK effectively being a Valve project I can understand your personal
preference, but I hope that's not Mesa's position.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569080640.6dDC.27588--

--===============1114421422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1114421422==--
