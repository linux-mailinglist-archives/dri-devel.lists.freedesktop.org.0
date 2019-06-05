Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE96365E1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 22:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FB3892AA;
	Wed,  5 Jun 2019 20:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F26FC892AA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 20:46:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E95F372167; Wed,  5 Jun 2019 20:46:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110844] AMDGPU Resets and blackscreens couple minutes into any
 game regardless of wine/proton/native - sound keeps playing
Date: Wed, 05 Jun 2019 20:46:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: nathaniel.horn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110844-502-yxf6mE5Yh1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110844-502@http.bugs.freedesktop.org/>
References: <bug-110844-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0001684796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0001684796==
Content-Type: multipart/alternative; boundary="15597675620.40Ee.15474"
Content-Transfer-Encoding: 7bit


--15597675620.40Ee.15474
Date: Wed, 5 Jun 2019 20:46:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110844

--- Comment #5 from nathaniel.horn@protonmail.com ---
(In reply to Alex Deucher from comment #4)
> You said it started happening for week or two ago.  What component(s) did
> you update at that time?

tbh I dont really know what it could have been.=20
Im on arch and i just did a pacman -Syu.=20
Im thinking its probably mesa or the kernel.=20
The problem is that my gpu apparently resets while trying to play a game.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597675620.40Ee.15474
Date: Wed, 5 Jun 2019 20:46:02 +0000
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
   title=3D"NEW - AMDGPU Resets and blackscreens couple minutes into any ga=
me regardless of wine/proton/native - sound keeps playing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110844#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU Resets and blackscreens couple minutes into any ga=
me regardless of wine/proton/native - sound keeps playing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110844">bug 11084=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nathaniel.horn&#64;protonmail.com" title=3D"nathaniel.horn&#64;protonmail.c=
om">nathaniel.horn&#64;protonmail.com</a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
0844#c4">comment #4</a>)
<span class=3D"quote">&gt; You said it started happening for week or two ag=
o.  What component(s) did
&gt; you update at that time?</span >

tbh I dont really know what it could have been.=20
Im on arch and i just did a pacman -Syu.=20
Im thinking its probably mesa or the kernel.=20
The problem is that my gpu apparently resets while trying to play a game.</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597675620.40Ee.15474--

--===============0001684796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0001684796==--
