Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8BCA97C5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 03:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F689CA2;
	Thu,  5 Sep 2019 01:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4484E89CA2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 01:01:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 418D872161; Thu,  5 Sep 2019 01:01:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Thu, 05 Sep 2019 01:01:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-SrfWzaSKJ5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0777802244=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0777802244==
Content-Type: multipart/alternative; boundary="15676453151.040fa973f.22280"
Content-Transfer-Encoding: 7bit


--15676453151.040fa973f.22280
Date: Thu, 5 Sep 2019 01:01:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #10 from Andrew Sheldon <asheldon55@gmail.com> ---
>I don't know how to interpret your last comment=20

Yeah, I was a bit unclear. I was just indicating that while I can workaround
the issue, it can still be triggered on my system as well. E.g. if I switch=
 to
75hz, it will be stuck at 850mhz (even after switching back), so it's possi=
ble
that the issue can be triggered through different ways (but the underlying
issue may be the same).=20

Anyway, I suspect that this bug, the one related to sensor readings (includ=
ing
the 75hz issue), are all related. It's most likely a video bios/firmware is=
sue
as it affects Windows as well, and some have even triggered the bug in BIOS
settings, with monitors that use 75hz.

One thing you could try is booting with a window manager/DE that doesn't use
any sort of hardware acceleration. That's the main difference I can figure
between my system, and yours (besides the fact I use x370 instead of x570).=
 I
would also try a lower resolution just to test, as that's a pretty non-stan=
dard
res, and might be another way of triggering this bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676453151.040fa973f.22280
Date: Thu, 5 Sep 2019 01:01:55 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;I don't know how to interpret your l=
ast comment </span >

Yeah, I was a bit unclear. I was just indicating that while I can workaround
the issue, it can still be triggered on my system as well. E.g. if I switch=
 to
75hz, it will be stuck at 850mhz (even after switching back), so it's possi=
ble
that the issue can be triggered through different ways (but the underlying
issue may be the same).=20

Anyway, I suspect that this bug, the one related to sensor readings (includ=
ing
the 75hz issue), are all related. It's most likely a video bios/firmware is=
sue
as it affects Windows as well, and some have even triggered the bug in BIOS
settings, with monitors that use 75hz.

One thing you could try is booting with a window manager/DE that doesn't use
any sort of hardware acceleration. That's the main difference I can figure
between my system, and yours (besides the fact I use x370 instead of x570).=
 I
would also try a lower resolution just to test, as that's a pretty non-stan=
dard
res, and might be another way of triggering this bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676453151.040fa973f.22280--

--===============0777802244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0777802244==--
