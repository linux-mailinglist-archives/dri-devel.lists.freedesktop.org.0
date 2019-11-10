Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82CF692E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 14:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE456E626;
	Sun, 10 Nov 2019 13:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BD176E62E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 13:53:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 58F4B720E2; Sun, 10 Nov 2019 13:53:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sun, 10 Nov 2019 13:53:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: danielsuarez369@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-jBCUgIcKu7@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0726794505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0726794505==
Content-Type: multipart/alternative; boundary="15733940195.BddAF.17060"
Content-Transfer-Encoding: 7bit


--15733940195.BddAF.17060
Date: Sun, 10 Nov 2019 13:53:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #31 from Daniel Suarez <danielsuarez369@protonmail.com> ---
(In reply to Marko Popovic from comment #30)
> (In reply to Daniel Suarez from comment #29)
> > (In reply to Marko Popovic from comment #28)
> > > I think this bug report can be closed now, Mesa 20 git basically fixe=
s radv
> > > related ring_gfx hangs, there is still hang that happens in Citra emu=
lator
> > > (ngg related) but AMD developers are aware of it so will probably get=
 fixed
> > > too.
> >=20
> > Yeah.. "soon". Still waiting for them to fix bug 111481
>=20
> SDMA hangs have nothing to do with ring_gfx hangs which were mostly radv
> related and are fixed now

Still, I can't even play Vulkan titles reliably because the system constant=
ly
hangs even with the workarounds in the bug report. AMD really needs to fix
them.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733940195.BddAF.17060
Date: Sun, 10 Nov 2019 13:53:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danielsuarez369&#64;protonmail.com" title=3D"Daniel Suarez &lt;danielsuarez=
369&#64;protonmail.com&gt;"> <span class=3D"fn">Daniel Suarez</span></a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11763#c30">comment #30</a>)
<span class=3D"quote">&gt; (In reply to Daniel Suarez from <a href=3D"show_=
bug.cgi?id=3D111763#c29">comment #29</a>)
&gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1117=
63#c28">comment #28</a>)
&gt; &gt; &gt; I think this bug report can be closed now, Mesa 20 git basic=
ally fixes radv
&gt; &gt; &gt; related ring_gfx hangs, there is still hang that happens in =
Citra emulator
&gt; &gt; &gt; (ngg related) but AMD developers are aware of it so will pro=
bably get fixed
&gt; &gt; &gt; too.
&gt; &gt;=20
&gt; &gt; Yeah.. &quot;soon&quot;. Still waiting for them to fix <a class=
=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">bug 111481</a>
&gt;=20
&gt; SDMA hangs have nothing to do with ring_gfx hangs which were mostly ra=
dv
&gt; related and are fixed now</span >

Still, I can't even play Vulkan titles reliably because the system constant=
ly
hangs even with the workarounds in the bug report. AMD really needs to fix
them.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733940195.BddAF.17060--

--===============0726794505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0726794505==--
