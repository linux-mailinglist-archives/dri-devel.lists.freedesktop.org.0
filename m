Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDAB4A6
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 02:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BAC89254;
	Sun, 28 Apr 2019 00:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E35FF89254
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 00:14:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D9C88723C9; Sun, 28 Apr 2019 00:14:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107612] [Vega10] Hard Lock [gfxhub] VMC page fault when opening
 Mario Kart 8 in Cemu under wine
Date: Sun, 28 Apr 2019 00:14:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: kazoon401+fd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107612-502-0T4IioX4xD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2083990453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2083990453==
Content-Type: multipart/alternative; boundary="15564104431.ce0c6E.23769"
Content-Transfer-Encoding: 7bit


--15564104431.ce0c6E.23769
Date: Sun, 28 Apr 2019 00:14:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107612

--- Comment #5 from coraxio <kazoon401+fd@gmail.com> ---
As far as I can tell, I'm having a similar problem with Pac-Man Championship
DX+. AMD Ryzen 5 2400G (Vega 11), AMDGPU drivers with up-to-date Arch softw=
are.
Since Pac-Man is a Windows game, I've run it through both Wine and Proton, =
and
each results in a hard lock with VMC page fault.

In particular, I can actually launch the game. But whenever I actually star=
t a
level (which is when the graphics, simple as they are, become more intense)=
, my
system locks up either instantly or within 5 seconds.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15564104431.ce0c6E.23769
Date: Sun, 28 Apr 2019 00:14:03 +0000
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
          bz_status_NEW "
   title=3D"NEW - [Vega10] Hard Lock [gfxhub] VMC page fault when opening M=
ario Kart 8 in Cemu under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107612#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] Hard Lock [gfxhub] VMC page fault when opening M=
ario Kart 8 in Cemu under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107612">bug 10761=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kazoon401+fd&#64;gmail.com" title=3D"coraxio &lt;kazoon401+fd&#64;gmail.com=
&gt;"> <span class=3D"fn">coraxio</span></a>
</span></b>
        <pre>As far as I can tell, I'm having a similar problem with Pac-Ma=
n Championship
DX+. AMD Ryzen 5 2400G (Vega 11), AMDGPU drivers with up-to-date Arch softw=
are.
Since Pac-Man is a Windows game, I've run it through both Wine and Proton, =
and
each results in a hard lock with VMC page fault.

In particular, I can actually launch the game. But whenever I actually star=
t a
level (which is when the graphics, simple as they are, become more intense)=
, my
system locks up either instantly or within 5 seconds.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15564104431.ce0c6E.23769--

--===============2083990453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2083990453==--
