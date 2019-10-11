Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A7D41ED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698326EC49;
	Fri, 11 Oct 2019 13:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 655D46EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:57:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5D4017296E; Fri, 11 Oct 2019 13:57:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Fri, 11 Oct 2019 13:57:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-9gSqXmNs6z@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1229701239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1229701239==
Content-Type: multipart/alternative; boundary="15708022370.2BCbb3cA1.32618"
Content-Transfer-Encoding: 7bit


--15708022370.2BCbb3cA1.32618
Date: Fri, 11 Oct 2019 13:57:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #11 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to takios+fdbugs from comment #10)
> (In reply to Marko Popovic from comment #9)
> > https://cgit.freedesktop.org/mesa/mesa/commit/
> > ?id=3Da2a68d551c1c2a4f13761ffa8f3f6f13fee7a384
> >=20
> > This might actually fix the ring_gfx type hangs or even sdma ones at le=
ast
> > for Vulkan API? Not exactly sure but will also be testing the latest ME=
SA
> > builds from Oibaf's PPA in following days and report back on the issue =
:)
>=20
> Sadly, I'm still getting the ring_gfx hangs after a few minutes of playing
> Trackmania 2.

Oh yes I forgot to add a reply here. It didn't solve any of the hangs for me
either.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15708022370.2BCbb3cA1.32618
Date: Fri, 11 Oct 2019 13:57:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to takios+fdbugs from <a href=3D"show_bug.cgi?id=3D1=
11763#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111763#c9">comment #9</a>)
&gt; &gt; <a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/">https:=
//cgit.freedesktop.org/mesa/mesa/commit/</a>
&gt; &gt; ?id=3Da2a68d551c1c2a4f13761ffa8f3f6f13fee7a384
&gt; &gt;=20
&gt; &gt; This might actually fix the ring_gfx type hangs or even sdma ones=
 at least
&gt; &gt; for Vulkan API? Not exactly sure but will also be testing the lat=
est MESA
&gt; &gt; builds from Oibaf's PPA in following days and report back on the =
issue :)
&gt;=20
&gt; Sadly, I'm still getting the ring_gfx hangs after a few minutes of pla=
ying
&gt; Trackmania 2.</span >

Oh yes I forgot to add a reply here. It didn't solve any of the hangs for me
either.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15708022370.2BCbb3cA1.32618--

--===============1229701239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1229701239==--
