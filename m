Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADCD4173
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29226EB3B;
	Fri, 11 Oct 2019 13:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02CBF6EB3B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:37:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F36047296E; Fri, 11 Oct 2019 13:37:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Fri, 11 Oct 2019 13:37:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: takios+fdbugs@takios.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-OeLffowpPs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1165600250=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1165600250==
Content-Type: multipart/alternative; boundary="15708010381.5ADbE3C.28737"
Content-Transfer-Encoding: 7bit


--15708010381.5ADbE3C.28737
Date: Fri, 11 Oct 2019 13:37:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #10 from takios+fdbugs@takios.de ---
(In reply to Marko Popovic from comment #9)
> https://cgit.freedesktop.org/mesa/mesa/commit/
> ?id=3Da2a68d551c1c2a4f13761ffa8f3f6f13fee7a384
>=20
> This might actually fix the ring_gfx type hangs or even sdma ones at least
> for Vulkan API? Not exactly sure but will also be testing the latest MESA
> builds from Oibaf's PPA in following days and report back on the issue :)

Sadly, I'm still getting the ring_gfx hangs after a few minutes of playing
Trackmania 2.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15708010381.5ADbE3C.28737
Date: Fri, 11 Oct 2019 13:37:18 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
takios+fdbugs&#64;takios.de" title=3D"takios+fdbugs&#64;takios.de">takios+f=
dbugs&#64;takios.de</a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11763#c9">comment #9</a>)
<span class=3D"quote">&gt; <a href=3D"https://cgit.freedesktop.org/mesa/mes=
a/commit/">https://cgit.freedesktop.org/mesa/mesa/commit/</a>
&gt; ?id=3Da2a68d551c1c2a4f13761ffa8f3f6f13fee7a384
&gt;=20
&gt; This might actually fix the ring_gfx type hangs or even sdma ones at l=
east
&gt; for Vulkan API? Not exactly sure but will also be testing the latest M=
ESA
&gt; builds from Oibaf's PPA in following days and report back on the issue=
 :)</span >

Sadly, I'm still getting the ring_gfx hangs after a few minutes of playing
Trackmania 2.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15708010381.5ADbE3C.28737--

--===============1165600250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1165600250==--
