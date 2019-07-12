Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0E6651A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 05:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8329C6E2BE;
	Fri, 12 Jul 2019 03:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C692989DE6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:39:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BD92272167; Fri, 12 Jul 2019 03:39:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Fri, 12 Jul 2019 03:39:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: joseph.coutcher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-dprmINpYE2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1734464199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1734464199==
Content-Type: multipart/alternative; boundary="15629027830.E16779.8797"
Content-Transfer-Encoding: 7bit


--15629027830.E16779.8797
Date: Fri, 12 Jul 2019 03:39:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #54 from Joe Coutcher <joseph.coutcher@gmail.com> ---
Ondrej - I'm on a fresh install of Ubuntu 19.04 with no workarounds applied,
using a similar setup to yours (HP Envy x360 15m-bq121dx.)  I installed ker=
nel
5.2 RC7 (since the AMD64 build of 5.2 final on kernel.ubuntu.com is broken),
and updated to the latest linux-firmware package available on the disco feed
(1.178.2).  I should also note I'm on HP BIOS firmware version 21.  While t=
he
system boots to the desktop environment, there's tons of garbage, and when
using Firefox, screen writes are occuring on random parts of the screen.  A=
lso,
I attempted running Basemark Web 3.0 in Firefox, and can consistently lock =
up
the machine.  For reference, the kernel version is 5.2.0-050200rc7-lowlaten=
cy.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629027830.E16779.8797
Date: Fri, 12 Jul 2019 03:39:43 +0000
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
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c54">Comme=
nt # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joseph.coutcher&#64;gmail.com" title=3D"Joe Coutcher &lt;joseph.coutcher&#6=
4;gmail.com&gt;"> <span class=3D"fn">Joe Coutcher</span></a>
</span></b>
        <pre>Ondrej - I'm on a fresh install of Ubuntu 19.04 with no workar=
ounds applied,
using a similar setup to yours (HP Envy x360 15m-bq121dx.)  I installed ker=
nel
5.2 RC7 (since the AMD64 build of 5.2 final on kernel.ubuntu.com is broken),
and updated to the latest linux-firmware package available on the disco feed
(1.178.2).  I should also note I'm on HP BIOS firmware version 21.  While t=
he
system boots to the desktop environment, there's tons of garbage, and when
using Firefox, screen writes are occuring on random parts of the screen.  A=
lso,
I attempted running Basemark Web 3.0 in Firefox, and can consistently lock =
up
the machine.  For reference, the kernel version is 5.2.0-050200rc7-lowlaten=
cy.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629027830.E16779.8797--

--===============1734464199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1734464199==--
