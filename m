Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FB27F13
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 16:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB89789128;
	Thu, 23 May 2019 14:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 261698918D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:05:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 22C7B72167; Thu, 23 May 2019 14:05:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109073] AMDGPU Radeon RX540 system freezes and/or crashes; poor
 performance with ac adapter plugged in
Date: Thu, 23 May 2019 14:05:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: proje.pdf@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109073-502-MruYM0TEIW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109073-502@http.bugs.freedesktop.org/>
References: <bug-109073-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2056706932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2056706932==
Content-Type: multipart/alternative; boundary="15586203322.c1feA.11558"
Content-Transfer-Encoding: 7bit


--15586203322.c1feA.11558
Date: Thu, 23 May 2019 14:05:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109073

--- Comment #11 from Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> ---
I have bisected the bug, also i have reported it:
https://bugzilla.kernel.org/show_bug.cgi?id=3D201077
its been a month since reporting it to linux kernel amd team, they acknowle=
dged
the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586203322.c1feA.11558
Date: Thu, 23 May 2019 14:05:32 +0000
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
   title=3D"NEW - AMDGPU Radeon RX540 system freezes and/or crashes; poor p=
erformance with ac adapter plugged in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109073#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU Radeon RX540 system freezes and/or crashes; poor p=
erformance with ac adapter plugged in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109073">bug 10907=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
proje.pdf&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.p=
df&#64;outlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</sp=
an></a>
</span></b>
        <pre>I have bisected the bug, also i have reported it:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D201077">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D201077</a>
its been a month since reporting it to linux kernel amd team, they acknowle=
dged
the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586203322.c1feA.11558--

--===============2056706932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2056706932==--
