Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE122956
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 00:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE78919B;
	Sun, 19 May 2019 22:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75EB38919B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 22:28:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 71E2472167; Sun, 19 May 2019 22:28:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 19 May 2019 22:28:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: chris@hodapp.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-KTvQzKl27s@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1413076376=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1413076376==
Content-Type: multipart/alternative; boundary="15583049301.bB1B7bD.18405"
Content-Transfer-Encoding: 7bit


--15583049301.bB1B7bD.18405
Date: Sun, 19 May 2019 22:28:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #23 from Chris Hodapp <chris@hodapp.email> ---
I've been building kernels like a fiend the last couple days. Making matters
more difficult is the fact that most of the intermediate commits produce
kernels that get stuck waiting for devices to come up (something that went =
in
the run-up to 5.1 disagrees with my machine but then got fixed for the actu=
al
5.1 release). No conclusive results yet except that both 5.0 and 5.0.17 work
(so I'm assuming the whole 5.0.X series works) but nothing in the 5.1 series
has truly been stable for me.

It's interesting that you both have two monitors. I am also trying to run t=
wo
monitors over displayport. For what it's worth, I'm also using KDE with sdd=
m,
though if KDE or sddm is making the GPU reset then that is on the graphics
driver, not the userspace programs that are trying to use it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583049301.bB1B7bD.18405
Date: Sun, 19 May 2019 22:28:50 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;hodapp.email" title=3D"Chris Hodapp &lt;chris&#64;hodapp.email&gt=
;"> <span class=3D"fn">Chris Hodapp</span></a>
</span></b>
        <pre>I've been building kernels like a fiend the last couple days. =
Making matters
more difficult is the fact that most of the intermediate commits produce
kernels that get stuck waiting for devices to come up (something that went =
in
the run-up to 5.1 disagrees with my machine but then got fixed for the actu=
al
5.1 release). No conclusive results yet except that both 5.0 and 5.0.17 work
(so I'm assuming the whole 5.0.X series works) but nothing in the 5.1 series
has truly been stable for me.

It's interesting that you both have two monitors. I am also trying to run t=
wo
monitors over displayport. For what it's worth, I'm also using KDE with sdd=
m,
though if KDE or sddm is making the GPU reset then that is on the graphics
driver, not the userspace programs that are trying to use it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583049301.bB1B7bD.18405--

--===============1413076376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1413076376==--
