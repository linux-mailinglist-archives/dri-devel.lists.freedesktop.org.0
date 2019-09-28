Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5CAC1078
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 11:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5EB6E107;
	Sat, 28 Sep 2019 09:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDB126E107
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 09:38:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B50EA72162; Sat, 28 Sep 2019 09:38:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111691] inconsistent cursor movement speed when using AMD 5700 XT
Date: Sat, 28 Sep 2019 09:38:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: a@bailtree.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111691-502-bQMY6Puhes@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111691-502@http.bugs.freedesktop.org/>
References: <bug-111691-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1198833543=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1198833543==
Content-Type: multipart/alternative; boundary="15696635060.7e09F857E.32500"
Content-Transfer-Encoding: 7bit


--15696635060.7e09F857E.32500
Date: Sat, 28 Sep 2019 09:38:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111691

--- Comment #13 from Michael Haworth <a@bailtree.co.uk> ---
running Xubuntu 19.10 - version information below (sorry for not providing =
it
earlier):

linux-firmware (1.182) eoan; urgency=3Dmedium

  * Rebase against
git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
    6c6918ad8ae0dfb2cb591484eba525409980c16f

linux-generic (5.3.0-12.13) eoan; urgency=3Dmedium

  * Master version: 5.3.0-12.13

xserver-xorg-video-amdgpu (19.0.1-1)

xorg-server 2:1.20.5+git20190820-0ubuntu3

I will provide xorg log too

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696635060.7e09F857E.32500
Date: Sat, 28 Sep 2019 09:38:26 +0000
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
   title=3D"NEW - inconsistent cursor movement speed when using AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - inconsistent cursor movement speed when using AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691">bug 11169=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
a&#64;bailtree.co.uk" title=3D"Michael Haworth &lt;a&#64;bailtree.co.uk&gt;=
"> <span class=3D"fn">Michael Haworth</span></a>
</span></b>
        <pre>running Xubuntu 19.10 - version information below (sorry for n=
ot providing it
earlier):

linux-firmware (1.182) eoan; urgency=3Dmedium

  * Rebase against
git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
    6c6918ad8ae0dfb2cb591484eba525409980c16f

linux-generic (5.3.0-12.13) eoan; urgency=3Dmedium

  * Master version: 5.3.0-12.13

xserver-xorg-video-amdgpu (19.0.1-1)

xorg-server 2:1.20.5+git20190820-0ubuntu3

I will provide xorg log too</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696635060.7e09F857E.32500--

--===============1198833543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1198833543==--
