Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1E44E10
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 23:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5548930C;
	Thu, 13 Jun 2019 21:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 917688930C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 21:04:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8E5AE72167; Thu, 13 Jun 2019 21:04:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Thu, 13 Jun 2019 21:04:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samueldgv@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-44dCmkgprG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0334570473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0334570473==
Content-Type: multipart/alternative; boundary="15604598513.a3b3dA4fD.14220"
Content-Transfer-Encoding: 7bit


--15604598513.a3b3dA4fD.14220
Date: Thu, 13 Jun 2019 21:04:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #31 from Sam <samueldgv@mailbox.org> ---
I have attached another trace I managed to get today at 22:24 while playing
Pillars Of Eternity (OpenGL)=20

It didn't freeze the whole as usual, just the whole Plasma and X sessions, =
so
the other TTYs were accessible. This is the first occurrence of this happen=
ing.
I was using the latest kernel default from the openSUSE Kernel:stable repo
(5.1.9-5.1), as per request on
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293

To note that, as in the other dmesgs attached, the crash seems to be caused=
 by
amdgpu. Should the bug category be moved there?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604598513.a3b3dA4fD.14220
Date: Thu, 13 Jun 2019 21:04:11 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samueldgv&#64;mailbox.org" title=3D"Sam &lt;samueldgv&#64;mailbox.org&gt;">=
 <span class=3D"fn">Sam</span></a>
</span></b>
        <pre>I have attached another trace I managed to get today at 22:24 =
while playing
Pillars Of Eternity (OpenGL)=20

It didn't freeze the whole as usual, just the whole Plasma and X sessions, =
so
the other TTYs were accessible. This is the first occurrence of this happen=
ing.
I was using the latest kernel default from the openSUSE Kernel:stable repo
(5.1.9-5.1), as per request on
<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293">https:/=
/bugzilla.opensuse.org/show_bug.cgi?id=3D1136293</a>

To note that, as in the other dmesgs attached, the crash seems to be caused=
 by
amdgpu. Should the bug category be moved there?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604598513.a3b3dA4fD.14220--

--===============0334570473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0334570473==--
