Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C0AF366
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 01:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48A6E9E4;
	Tue, 10 Sep 2019 23:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 768586E9DC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 23:37:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6D40072167; Tue, 10 Sep 2019 23:37:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110199] [amdgpu] Screen flickering when using a 75Hz monitor
 paired with an RX 480 GPU
Date: Tue, 10 Sep 2019 23:37:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: guimarcalsilva@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110199-502-9AaOO1CfEZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110199-502@http.bugs.freedesktop.org/>
References: <bug-110199-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0204867710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0204867710==
Content-Type: multipart/alternative; boundary="15681586240.c4BfC.30292"
Content-Transfer-Encoding: 7bit


--15681586240.c4BfC.30292
Date: Tue, 10 Sep 2019 23:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110199

--- Comment #14 from guimarcalsilva@gmail.com ---
I'm also affected by this bug. I have an MSI Rx 570 and my monitor is an Ac=
er
SA230. I'm using the display through HDMI since it doesn't have DP.


In Linux Manjaro with kernel 4.19 the problem persists no matter what I try,
Freesync enabled or disabled through the monitor, but now I'm typing on a L=
ive
USB of OpenMandriva Linux and after login, I went to KDE display settings a=
nd
changed my framerate from 75 to 60 and back to 75 again, and the problem we=
nt
away. The kernel is 5.1.9-desktop-1omv4000.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681586240.c4BfC.30292
Date: Tue, 10 Sep 2019 23:37:04 +0000
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
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199">bug 11019=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
guimarcalsilva&#64;gmail.com" title=3D"guimarcalsilva&#64;gmail.com">guimar=
calsilva&#64;gmail.com</a>
</span></b>
        <pre>I'm also affected by this bug. I have an MSI Rx 570 and my mon=
itor is an Acer
SA230. I'm using the display through HDMI since it doesn't have DP.


In Linux Manjaro with kernel 4.19 the problem persists no matter what I try,
Freesync enabled or disabled through the monitor, but now I'm typing on a L=
ive
USB of OpenMandriva Linux and after login, I went to KDE display settings a=
nd
changed my framerate from 75 to 60 and back to 75 again, and the problem we=
nt
away. The kernel is 5.1.9-desktop-1omv4000.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681586240.c4BfC.30292--

--===============0204867710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0204867710==--
