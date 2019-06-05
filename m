Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3836285
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26B88951B;
	Wed,  5 Jun 2019 17:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DD6F8951B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:28:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7503972167; Wed,  5 Jun 2019 17:28:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110844] AMDGPU Resets and blackscreens couple minutes into any
 game regardless of wine/proton/native - sound keeps playing
Date: Wed, 05 Jun 2019 17:28:43 +0000
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
Message-ID: <bug-110844-502-wgyXIoR9SY@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0196957523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0196957523==
Content-Type: multipart/alternative; boundary="15597557230.48FC5B5.1712"
Content-Transfer-Encoding: 7bit


--15597557230.48FC5B5.1712
Date: Wed, 5 Jun 2019 17:28:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110844

--- Comment #3 from nathaniel.horn@protonmail.com ---
If you have any idea as to how i should narrow down the issue, im willing to
try.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597557230.48FC5B5.1712
Date: Wed, 5 Jun 2019 17:28:43 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110844#c3">Commen=
t # 3</a>
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
        <pre>If you have any idea as to how i should narrow down the issue,=
 im willing to
try.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597557230.48FC5B5.1712--

--===============0196957523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0196957523==--
