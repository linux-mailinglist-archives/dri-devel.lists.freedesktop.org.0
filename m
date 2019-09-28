Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DAC122F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 23:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299F66E26C;
	Sat, 28 Sep 2019 21:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0B176E26C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 21:07:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BAE8672167; Sat, 28 Sep 2019 21:07:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111847] Radeon 7, no audio over hdmi 2.0 4k and accelerated
 audio over displayport in fullhd display
Date: Sat, 28 Sep 2019 21:07:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: sebastianlacuesta@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111847-502-ffkRd0eCqs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111847-502@http.bugs.freedesktop.org/>
References: <bug-111847-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1179663013=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1179663013==
Content-Type: multipart/alternative; boundary="15697048251.49EBa425.32172"
Content-Transfer-Encoding: 7bit


--15697048251.49EBa425.32172
Date: Sat, 28 Sep 2019 21:07:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111847

--- Comment #1 from Sebasti=C3=A1n Lacuesta <sebastianlacuesta@gmail.com> -=
--
Well, just updated drivers in Windows, used sound from TV. Then reboot on L=
inux
and problem solved. I have rebooted several times on Linux before doing this
and problem persisted. Now it looks everything fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15697048251.49EBa425.32172
Date: Sat, 28 Sep 2019 21:07:05 +0000
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
   title=3D"NEW - Radeon 7, no audio over hdmi 2.0 4k and accelerated audio=
 over displayport in fullhd display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111847#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon 7, no audio over hdmi 2.0 4k and accelerated audio=
 over displayport in fullhd display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111847">bug 11184=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sebastianlacuesta&#64;gmail.com" title=3D"Sebasti=C3=A1n Lacuesta &lt;sebas=
tianlacuesta&#64;gmail.com&gt;"> <span class=3D"fn">Sebasti=C3=A1n Lacuesta=
</span></a>
</span></b>
        <pre>Well, just updated drivers in Windows, used sound from TV. The=
n reboot on Linux
and problem solved. I have rebooted several times on Linux before doing this
and problem persisted. Now it looks everything fine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15697048251.49EBa425.32172--

--===============1179663013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1179663013==--
