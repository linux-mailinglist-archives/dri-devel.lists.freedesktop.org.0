Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B5DCA0CC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029FE89CE0;
	Thu,  3 Oct 2019 14:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9961089CE0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 14:59:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 929E172162; Thu,  3 Oct 2019 14:59:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111848] AMDGPU and display fails after resume from suspend
Date: Thu, 03 Oct 2019 14:59:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@cschwarz.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111848-502-i2Sz1EMJFe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111848-502@http.bugs.freedesktop.org/>
References: <bug-111848-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1619390320=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1619390320==
Content-Type: multipart/alternative; boundary="15701147760.f89761EB6.18303"
Content-Transfer-Encoding: 7bit


--15701147760.f89761EB6.18303
Date: Thu, 3 Oct 2019 14:59:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111848

--- Comment #17 from me@cschwarz.com ---
The kernel-package.py script is broken.
I'll build kernels directly.
Git bisect says approximately 13 steps are required between v4.20 and v5.0.
Will report back in ~14 days when that's done (bug manifests only after some
uptime).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701147760.f89761EB6.18303
Date: Thu, 3 Oct 2019 14:59:36 +0000
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
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848">bug 11184=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;cschwarz.com" title=3D"me&#64;cschwarz.com">me&#64;cschwarz.com</a>
</span></b>
        <pre>The kernel-package.py script is broken.
I'll build kernels directly.
Git bisect says approximately 13 steps are required between v4.20 and v5.0.
Will report back in ~14 days when that's done (bug manifests only after some
uptime).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701147760.f89761EB6.18303--

--===============1619390320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1619390320==--
